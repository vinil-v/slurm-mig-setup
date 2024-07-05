#!/bin/sh
curl -O https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
chmod +x Anaconda3-2024.06-1-Linux-x86_64.sh
sh Anaconda3-2024.06-1-Linux-x86_64.sh -b 
export PATH=$PATH:/shared/home/vinil/anaconda3/bin
/shared/home/vinil/anaconda3/bin/conda init
source ~/.bashrc
/shared/home/vinil/anaconda3/bin/conda create -n mlprog  tensorflow-gpu -y
