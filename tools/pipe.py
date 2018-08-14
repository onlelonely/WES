#!/opt/conda/bin/python3

"""
Created on Mon Aug 13 23:26:19 2018

@author: Li Hsin Chang
"""

import argparse
import subprocess

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("references", help="Reference FASTA file(s) used for alignment")
    parser.add_argument("read_F", help="Foward Reads FASTA or FASTQ file to be aligned")
    parser.add_argument("read_R", help="Reverse Reads FASTA or FASTQ file to be aligned")
    parser.add_argument("-o", "--out", help="Output file or destination (default is stdout)")
    args = parser.parse_args()

print ("/usr/local/bin/bwa mem -t 12 -M -r '@RG ID:001 SM:1485 PL:illumina' {index} {F} {R} | /usr/local/samtools/bin/samtools sort -O BAM -@ 12 -o {out}".format(index=args.references, F=args.read_F, R=args.read_R, out=args.out))

subprocess.call("/usr/local/bin/bwa mem -t 12 -M -r '@RG ID:001 SM:1485 PL:illumina' {index} {F} {R} | /usr/local/samtools/bin/samtools sort -O BAM -@ 12 -o {out}".format(index=args.references, F=args.read_F, R=args.read_R, out=args.out),shell=True, executable='/bin/bash')
