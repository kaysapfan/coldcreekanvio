#!/bin/bash
#$ -N run-hmms_7.26-E11.1
#$ -o /u/scratch/b/big2258/coldcreekanvio/hmms/7.26_11.1o

#TODO: change output and error files

#$ -e /u/scratch/b/big2258/coldcreekanvio/hmms/7.26_11.1e
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

# FROM HERE TO THE NEXT CAP I DID BEFOREHAND 

# issues with format- reformat the fasta bc of bad deflines
    # http://merenlab.org/2016/06/22/anvio-tutorial-v2/#take-a-look-at-your-fasta-file
#anvi-script-reformat-fasta /u/scratch/b/big2258/coldcreekanvio/02_ASSEMBLY/7.21_E12.1/final.contigs.fa -o E12_1.contigs-fixed.fa -l 0 --simplify-names 
#  '--report-file' will create a tab-delim file where bad deflines are changed... I did not use this 

#mv E12_1.contigs-fixed.fa E12_1.contigs.fa
# overwrite the name so it makes it easier below

# DID THE ABOVE ALREADY 

# create a contigs db for each of the samples before running the hmms
 anvi-gen-contigs-database -f E11_1.contigs.fa -o E11_1.contigs.db -n 'Sample E12_2'

    # Anvi'o will use 'prodigal' by Hyatt et al (doi:10.1186/1471-2105-11-119) to
    # identify open reading frames in your data.


# this process will take ~20 minutes! (per individual sample)
