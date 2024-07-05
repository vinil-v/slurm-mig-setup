#!/bin/sh
#SBATCH --job-name=MLjob
#SBATCH --partition=gpu
#SBATCH --ntasks=10
#SBATCH --gres=gpu:1g.22gb:1
export PATH=$PATH:/shared/home/vinil/anaconda3/bin/conda
source /shared/home/vinil/anaconda3/bin/activate mlprog
python cifar10.py