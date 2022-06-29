!/bin/bash

# save this file somewhere on your disk. open your terminal, and go there. then type these commands:
#
# chmod +x anvi-ubuntu-setup.sh
# ./anvi-ubuntu-setup.sh
#
# and then get some coffee, and come back to see whether it's your lucky day.
 
set -e
 
export DEBIAN_FRONTEND=noninteractive
 
sudo apt-get update
 
# stuff to install with apt-get
sudo apt-get -y install python-pip
sudo apt-get -y install python-numpy
sudo apt-get -y install cython
sudo apt-get -y install libgsl0-dev
sudo apt-get -y install libblas-dev
sudo apt-get -y install liblapacke
sudo apt-get -y install gfortran libopenblas-dev liblapack-dev
sudo apt-get -y install zlibc zlib1g-dev zlib1g
sudo apt-get -y install sqlite
sudo apt-get -y install libhdf5-serial-dev
 
# pip
wget https://raw.githubusercontent.com/merenlab/anvio/master/requirements.txt -O all-reqs.txt
cat all-reqs.txt | grep -v numpy | grep -v scipy > final-reqs.txt
sudo pip install -r final-reqs.txt

# prodigal
wget https://github.com/hyattpd/Prodigal/archive/v2.6.2.tar.gz
tar -zxvf v2.6.2.tar.gz && cd Prodigal-2.6.2/ && make
sudo cp prodigal /usr/bin/
cd
rm -rf v2.6.2.tar.gz Prodigal-2.6.2
 
# hmmer
wget http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz
tar -zxvf hmmer-3.1b2.tar.gz 
cd hmmer-3.1b2
./configure
make
sudo make install
cd
rm -rf hmmer-3.1b2 hmmer-3.1b2.tar.gz
 
# install anvio
sudo pip install anvio
