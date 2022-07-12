#!/bin/bash


#$ -N coassembly
#$ -wd <set wd>
#$ -m ea -M pfannmulk@sou.edu

# input/output file paths below
    infile=/u/scratch/b/big2258/coldcreekanvio/....#enter file name here
    outfile=/u/scratch/b/big2258/#fix file path/name

# notes: anvio uses MEGAHIT for assembly... fingers crossed there is enough memory

#to-do: check memory for the files and the file sizes, check server cpu

# create two environment variables and look at them
R1s=`ls 01_QC/*QUALITY_PASSED_R1* | python -c 'import sys; print(",".join([x.strip() for x in sys.stdin.readlines()]))'`
R2s=`ls 01_QC/*QUALITY_PASSED_R2* | python -c 'import sys; print(",".join([x.strip() for x in sys.stdin.readlines()]))'`

# run megahit
# specify what min contig size and num threads (depends on cpu)- check server cpu
megahit -1 $R1s -2 $R2s --min-contig-len $MIN_CONTIG_SIZE -m 0.85 -o 02_ASSEMBLY/ -t $NUM_THREADS


# check the end of the assembly log to determine if things went smoothly or not
tail 02_ASSEMBLY/log

# finalize contig.fa file while simplifying the names and eliminating any short/
