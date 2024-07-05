#!/bin/sh
# Configure Slurm partitions
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Configuring Slurm partitions"
echo "------------------------------------------------------------------------------------------------------------------------------"
cat << 'EOF' > /sched/azure.conf
PartitionName=gpu Nodes=h100vm Default=YES MaxTime=INFINITE State=UP
NodeName=h100vm CPUs=40 Boards=1 SocketsPerBoard=1 CoresPerSocket=40 ThreadsPerCore=1 RealMemory=322442 Gres=gpu:1g.22gb:1
EOF
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Slurm partitions configured"
echo "------------------------------------------------------------------------------------------------------------------------------"
