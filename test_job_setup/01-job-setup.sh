#!/bin/sh
yum install libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver -y

curl -O https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
chmod +x Anaconda3-2024.06-1-Linux-x86_64.sh
sh Anaconda3-2024.06-1-Linux-x86_64.sh -b 
export PATH=$PATH:/sched/home/vinil1/anaconda3/bin
conda create -n mlprog  tensorflow-gpu -y
conda activate mlprog
