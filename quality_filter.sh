#!/bin/bash

# change files below
    infile=/data/bioinfo/READS2/R1_001.fastq.gz
    outfile=/data/bioinfo/READS2/aln/R1_001.sam

# for more in-depth info read https://github.com/merenlab/illumina-utils/blob/master/README.md

mkdir 01_QC    
    # create a directory for quality-filtered reads

iu-gen-configs coldcreek_samples.txt -o 01_QC   
    # create config files 

ls 01_QC/    
    # check output here to make sure it reads the txt file

# now you can run a for loop to iterate over your samples and filter them
for ini in 01_QC/*.ini; do iu-merge-pairs $ini; done
    # says to make modifications for clusters... ?
    # do we have large inserts or overlapping reads?
    # if large inserts use $iu-filter-quality-minoche command
    # use iu-merge-pairs for overlapping!!!
    
ls 01_QC/
    # check output file and make sure it is different than before

# look at stats files to make sure it worked
grep 'total pairs passed' 01_QC/*STATS.txt
    #if it looks good you can begin coassembly
