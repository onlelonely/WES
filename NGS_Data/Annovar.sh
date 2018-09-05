#!/bin/bash

for subject in 5 6 9 11 12 13 14 15 16 20 21 23 24 25 26 28 32 33 34 38 40 44 45 46 47 48 49 50 53 55 64 65 72 74 78 81 82 83 86 95 96 99 100 102 103 bA625 bA627 bA707 SR1 SR2

do

docker run --rm -v /mnt/IronWolf/WES/NGS_Data:/DATA -v /mnt/IronWolf/WES/ref:/ref -it onlelonely/annovar /DATA/4_VCF/$subject"_output.vcf" /ref/humandb -buildver hg38 -out $subject -remove -protocol refGene,ensGene,1000g2015aug_eas,avsnp150,dbnsfp33a,intervar_20180118,esp6500siv2_all,exac03,ljb26_all,gnomad_genome,dbscsnv11,intervar_20180118,gnomad_exome,clinvar_20180603,mcap,revel -operation g,g,f,f,f,f,f,f,f,f,f,f,f,f,f,f -nastring . -vcfinput -otherinfo

done
