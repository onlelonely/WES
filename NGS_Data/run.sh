#!/bin/bash

for subject in bA625 bA627 bA707 SR1 SR2

do

#Step1:bwa

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it tools pipe /ref/Homo_sapiens_assembly38.fasta /DATA/1_RAW/$subject/$subject"_R1.fastq.gz" /DATA/1_RAW/$subject/$subject"_R2.fastq.gz" -o /DATA/2_Sorted/$subject"_sorted.bam"

#Step2:Mark duplicates

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -it broadinstitute/gatk:4.beta.6 ./gatk-launch MarkDuplicates -I /DATA/2_Sorted/$subject"_sorted.bam" -O /DATA/3_GATK/$subject"_dedup.bam" -M /DATA/3_GATK/$subject"_dedup_metrics.txt"

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -it broadinstitute/gatk:4.beta.6 ./gatk-launch BuildBamIndex -I /DATA/3_GATK/$subject"_dedup.bam"


#Step3:Baserecalibrator

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it broadinstitute/gatk:4.beta.6 ./gatk-launch BaseRecalibrator -R /ref/Homo_sapiens_assembly38.fasta -I /DATA/3_GATK/$subject"_dedup.bam" --knownSites /ref/dbsnp_146.hg38.vcf.gz --knownSites /ref/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz -O /DATA/3_GATK/$subject"_recal.table"

#Step4:BQSR

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it broadinstitute/gatk:4.beta.6 ./gatk-launch ApplyBQSR -R /ref/Homo_sapiens_assembly38.fasta -I /DATA/3_GATK/$subject"_dedup.bam" --bqsr_recal_file /DATA/3_GATK/$subject"_recal.table" -O /DATA/3_GATK/$subject"_bqsr.bam"

#Step5:Call VCF

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it broadinstitute/gatk:4.beta.6 ./gatk-launch HaplotypeCaller -R /ref/Homo_sapiens_assembly38.fasta -I /DATA/3_GATK/$subject"_bqsr.bam" --bamout /DATA/4_VCF/$subject"_bamout.bam" -O /DATA/4_VCF/$subject"_output.vcf"

done
