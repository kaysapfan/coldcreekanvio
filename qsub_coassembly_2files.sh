#!/bin/bash
#$ -N qsub_coassembly_7.24_E9.1
#$ -o /u/scratch/b/big2258/coldcreekanvio/coassembly_files/onesamp_7.26_1.3o

#TODO: change output and error files

#$ -e /u/scratch/b/big2258/coldcreekanvio/coassembly_files/onesamp_7.26_1.3e
#$ -cwd 
#$ -l h_data=7.5G
#$ -l h_rt=23:00:00
#$ -l h_vmem=30G
#$ -pe shared 4
#$ -w e
    # verify options and abort if there is an error
#$ -m ea 
#$ -M pfannmulk@sou.edu


. /u/local/Modules/default/init/modules.sh
module load anaconda3

conda activate anvio-7.1

# input/output file paths below
    #infile=/u/scratch/b/big2258/coldcreekanvio/01_QC/2sample_ex
    #outfile=/u/scratch/b/big2258/coldcreekanvio/02_ASSEMBLY/2files_assembly

    #TODO: change input/output

# notes: anvio uses MEGAHIT for assembly... fingers crossed there is enough memory

#to-do: check memory for the files and the file sizes, check server cpu

# initialize variables for num_threads and min_contig_length
NUM_THREADS=8
MIN_CONTIG_SIZE=1000
KMAX_SIZE=59

# create two environment variables and look at them
#CHANGE THE FILES/TRANSFER AND THEN CORRECT HTE 01_QC HERE
R1s=`ls 01_QC/sample_E3_1-QUALITY_PASSED_R1.fastq | python -c 'import sys; print(",".join([x.strip() for x in sys.stdin.readlines()]))'`
R2s=`ls 01_QC/sample_E3_1-QUALITY_PASSED_R2.fastq | python -c 'import sys; print(",".join([x.strip() for x in sys.stdin.readlines()]))'`
    # already created the environment variables- keep here to make sure it runs in qsub job

# run megahit
# specify what min contig size and num threads (depends on cpu)- check server cpu
megahit -1 $R1s -2 $R2s --k-max $KMAX_SIZE --min-contig-len $MIN_CONTIG_SIZE -m 0.85 -o 02_ASSEMBLY/7.26_E1.3 -t $NUM_THREADS
    # the 1000 min contig size and 40 num threads is the default from anvio

#TODO: change kmax value to 59 instead of 81
#TODO: change the output file and clean up scratch directory for new scripts to run (only keep mini for data usage)

# check the end of the assembly log to determine if things went smoothly or not
#tail 02_ASSEMBLY/log

# finalize contig.fa file while simplifying the names and eliminating any short/
