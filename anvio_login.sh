#!/bin/bash

qrsh -l h_rt=03:00:00,h_data=10G    # this will login to a shell on the hoffman2 server
# please note that the amount of data may have to be increased, this is just a basic setting

module load anaconda3   # this will allow conda to open anvio

conda activate anvio-7.1

"Anvi'o is now open, you can run your next command now."

# from here you can run whatever script you want- probably start with a file

