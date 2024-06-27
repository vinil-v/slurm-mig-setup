#!/bin/sh
git clone https://gitlab.com/nvidia/hpc/slurm-mig-discovery.git
cd slurm-mig-discovery/
gcc -g -o mig -I/usr/local/cuda/include -I/usr/cuda/include mig.c -lnvidia-ml
./mig
cp gres.conf /sched/gres.conf
cp cgroup_allowed_devices_file.conf /sched/cgroup_allowed_devices_file.conf
