#!/bin/bash
#$ -N run-hmms_7.25-E12.1
#$ -o /u/scratch/b/big2258/coldcreekanvio/hmms/7.25-12.1o

#TODO: change output and error files

#$ -e /u/scratch/b/big2258/coldcreekanvio/hmms/7.25_12.1e
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


# I need the end flag bc I tried to run it from the command line and it took too long
# if there are some hmm files the program won't run, this will overwrite them.
# CHANGE BEFORE NEXT SAMPLE!!
anvi-run-hmms -c E12_1.contigs.db --just-do-it

