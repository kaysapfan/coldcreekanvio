#!/bin/bash


#$ -N quality_filter
#$ -m ea -M pfannmulk@sou.edu

# input/output file paths below
    #infile=/u/scratch/b/big2258/coldcreekanvio/coldcreek_samples.txt
    #outfile=/u/scratch/b/big2258/coldcreekanvio/01_QC

# for more in-depth info read https://github.com/merenlab/illumina-utils/blob/master/README.md

# create a directory for quality-filtered reads
# already made -- 01_QC in /u/scratch/b/big2258/coldcreekanvio/01_QC

#iu-gen-configs coldcreek_samples.txt -o 01_QC   
    # create config files 

#ls 01_QC/    
    # check output here to make sure it reads the txt file

# now you can run a for loop to iterate over your samples and filter them
for ini in 01_QC/*.ini; do iu-filter-quality-minoche $ini; done
    # says to make modifications for clusters... ?
    # do we have large inserts or overlapping reads? 320bp-520bp ... = smaller inserts?
    # if large inserts use $iu-filter-quality-minoche command
    # use $iu-merge-pairs for overlapping
    
#ls 01_QC/
    # check output file and make sure it is different than before

# look at stats files to make sure it worked
#grep 'total pairs passed' 01_QC/*STATS.txt
    #if it looks good you can begin coassembly
