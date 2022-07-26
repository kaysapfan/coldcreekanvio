#!/bin/bash
#$ -N map_7.25-E1.1
#$ -o /u/scratch/b/big2258/coldcreekanvio/map_files/7.25-1.1o

#TODO: change output and error files

#$ -e /u/scratch/b/big2258/coldcreekanvio/map_files/7.25_1.1e
#$ -cwd 
#$ -l h_data=6.25G
#$ -l h_rt=23:00:00
#$ -l h_vmem=25G
#$ -pe shared 4
#$ -w e
    # verify options and abort if there is an error
#$ -m ea 
#$ -M pfannmulk@sou.edu


. /u/local/Modules/default/init/modules.sh
module load anaconda3

conda activate anvio-7.1

# make a directory for the mapped reads - did this beforehand
#mkdir 04_MAPPING 

# initialize variables here:
NUM_THREADS=4

# build an index for the contigs
bowtie2-build /u/scratch/b/big2258/coldcreekanvio/02_ASSEMBLY/7.21_onesample/final.contigs.fa 04_MAPPING/E1_1.contigs

# create/get an indexed BAM file for one of the samples
bowtie2 --threads $NUM_THREADS -x 04_MAPPING/E1_1.contigs -1 01_QC/sample_E1_1-QUALITY_PASSED_R1.fastq -2 01_QC/sample_E1_1-QUALITY_PASSED_R2.fastq -S 04_MAPPING/E1_1.sam
samtools view -F 4 -bS 04_MAPPING/E1_1.sam > 04_MAPPING/E1_1-RAW.bam
anvi-init-bam 04_MAPPING/E1_1-RAW.bam -o 04_MAPPING/E1_1.bam
rm 04_MAPPING/E1_1.sam 04_MAPPING/E1_1-RAW.bam




