#!/bin/sh
nvidia-smi -pm 1
nvidia-smi -mig 1
nvidia-smi -cgi 15,15,15,15 -C
git clone https://gitlab.com/nvidia/hpc/slurm-mig-discovery.git
cd slurm-mig-discovery/
gcc -g -o mig -I/usr/local/cuda/include -I/usr/cuda/include mig.c -lnvidia-ml
./mig
echo y | cp gres.conf /sched/gres.conf
cp cgroup_allowed_devices_file.conf /sched/cgroup_allowed_devices_file.conf