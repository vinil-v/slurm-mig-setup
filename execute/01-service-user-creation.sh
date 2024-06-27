#!/bin/sh
# Create the munge and slurm users and groups
groupadd -g 11101 munge
useradd -u 11101 -g 11101 -s /bin/false -M munge
groupadd -g 11100 slurm
useradd -u 11100 -g 11100 -s /bin/false -M slurm
