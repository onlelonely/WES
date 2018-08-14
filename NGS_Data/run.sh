#/bin/bash

#Step1:bwa

docker run -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it tools pipe /ref/Homo_sapiens_assembly38.fasta /DATA/1_RAW/S103/103_R1.fastq.gz /DATA/1_RAW/S103/103_R2.fastq.gz -o /DATA/2_Sorted/103.bam

#Step2:Mark duplicates

docker run -v /mnt/IronWolf/WES/NGS_Data:/DATA -it broadinstitute/gatk:4.beta.6 ./gatk-launch MarkDuplicates -I /DATA/2_Sorted/103_sorted.bam -O /DATA/3_GATK/103_dedup.bam -M /DATA/3_GATK/103_dedup_metrics.txt

docker run -v /mnt/IronWolf/WES/NGS_Data:/DATA -it broadinstitute/gatk:4.beta.6 ./gatk-launch BuildBamIndex -I /DATA/3_GATK/103_dedup.bam


#Step3:Baserecalibrator

docker run -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it broadinstitute/gatk:4.beta.6 ./gatk-launch BaseRecalibrator -R /ref/Homo_sapiens_assembly38.fasta -I /DATA/3_GATK/103_dedup.bam --known-sites /ref/dbsnp_146.hg38.vcf.gz --known-sites /ref/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz -O /DATA/3_GATK/sample_recal.table

#Step4:BQSR

docker run -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it broadinstitute/gatk:4.beta.6 ./gatk-launch ApplyBQSR -R /ref/Homo_sapiens_assembly38.fasta -I /DATA/3_GATK/103_dedup.bam --bqsr-recal-file /DATA/3_GATK/sample_recal.table -O /DATA/3_GATK/103_bqsr.bam

#Step5:Call VCF

docker run -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it broadinstitute/gatk:4.beta.6 ./gatk-launch HaplotypeCaller -R /ref/Homo_sapiens_assembly38.fasta -I /DATA/3_GATK/103_bqsr.bam --bamout /DATA/4_VCF/103_bamout.bam -O /DATA/4_VCF/103_output.vcf

