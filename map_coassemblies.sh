#!/bin/bash


#$ -N mapping_coassemblies
#$ -wd <set wd>
#$ -m ea -M pfannmulk@sou.edu

# make a directory for the mapped reads
mkdir 04_MAPPING 

# build an index for the contigs
bowtie2-build 03_CONTIGS/contigs.fa 04_MAPPING/contigs

# create/get an indexed BAM file for one of the samples
bowtie2 --threads $NUM_THREADS -x 04_MAPPING/contigs -1 01_QC/Sample_01-QUALITY_PASSED_R1.fastq -2 01_QC/Sample_01-QUALITY_PASSED_R2.fastq -S 04_MAPPING/Sample_01.sam
samtools view -F 4 -bS 04_MAPPING/Sample_01.sam > 04_MAPPING/Sample_01-RAW.bam
anvi-init-bam 04_MAPPING/Sample_01-RAW.bam -o 04_MAPPING/Sample_01.bam
rm 04_MAPPING/Sample_01.sam 04_MAPPING/Sample_01-RAW.bam
# replace numthreads and usually you use 8 (need an integer but depends on cpu)

# write a for loop text with the above example ...



