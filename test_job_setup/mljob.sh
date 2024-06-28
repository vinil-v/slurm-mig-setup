#!/bin/sh
#!/bin/sh
#SBATCH --job-name=MLjob
#SBATCH --partition=gpu
#SBATCH --ntasks=4
#SBATCH --gres=gpu:1

export PATH=$PATH:/sched/home/vinil1/anaconda3/bin
conda activate mlprog
wget https://raw.githubusercontent.com/vinilvadakkepurakkal/basic-gpu-test/main/gputest.py
python gputest.py