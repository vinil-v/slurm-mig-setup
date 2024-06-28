#!/bin/sh
#SBATCH --job-name=MLjob
#SBATCH --partition=gpu
#SBATCH --ntasks=10
#SBATCH --gres=gpu:1g.11gb:1

export PATH=$PATH:/shared/home/vinil/anaconda3/bin/conda
/shared/home/vinil/anaconda3/bin/conda activate mlprog
wget https://raw.githubusercontent.com/vinilvadakkepurakkal/basic-gpu-test/main/gputest.py
python gputest.py