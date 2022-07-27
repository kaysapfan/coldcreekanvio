#!/bin/bash
#$ -N profiledb_7.26-E1.1-5.25
#$ -o /u/scratch/b/big2258/coldcreekanvio/profile_files/7.26_1.1_5.25o

#TODO: change output and error files

#$ -e /u/scratch/b/big2258/coldcreekanvio/profile_files/7.26_1.1_5.25e
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


anvi-profile -i /u/scratch/b/big2258/coldcreekanvio/04_MAPPING/E1_1.bam -c E1_1.contigs.db -o /u/scratch/b/big2258/coldcreekanvio/cc.profiles/E1_1.PROFILE.db

# create a profile from sample [...] bam and contig.dbs to output 
