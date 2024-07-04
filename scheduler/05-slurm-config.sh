#!/bin/sh
# Configure Slurm

slurm_conf="/sched/slurm.conf"
sched_dir="/sched"


echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Configuring Slurm"
echo "------------------------------------------------------------------------------------------------------------------------------"

cat <<EOF > "$slurm_conf"
MpiDefault=none
ProctrackType=proctrack/cgroup
ReturnToService=2
PropagateResourceLimits=ALL
SlurmctldPidFile=/var/run/slurmctld.pid
SlurmdPidFile=/var/run/slurmd.pid
SlurmdSpoolDir=/var/spool/slurmd
SlurmUser=slurm
StateSaveLocation=/var/spool/slurmctld
SwitchType=switch/none
TaskPlugin=task/affinity,task/cgroup
SchedulerType=sched/backfill
SelectType=select/cons_tres
SelectTypeParameters=CR_Core
GresTypes=gpu
SelectTypeParameters=CR_Core_Memory
# We use a "safe" form of the CycleCloud cluster_name throughout slurm.
# First we lowercase the cluster name, then replace anything
# that is not letters, digits and '-' with a '-'
# eg My Cluster == my-cluster
ClusterName=mycluster
JobAcctGatherType=jobacct_gather/none
SlurmctldDebug=debug
SlurmctldLogFile=/var/log/slurmctld/slurmctld.log
SlurmctldParameters=idle_on_node_suspend
SlurmdDebug=debug
SlurmdLogFile=/var/log/slurmd/slurmd.log
# TopologyPlugin=topology/tree
# If you use the TopologyPlugin you likely also want to use our
# job submit plugin so that your jobs run on a single switch
# or just add --switches 1 to your submission scripts
# JobSubmitPlugins=lua
PrivateData=cloud
TreeWidth=65533
ResumeTimeout=1800
SuspendTimeout=600
SuspendTime=300
SchedulerParameters=max_switch_wait=24:00:00
# Only used with dynamic node partitions.
MaxNodeCount=10000
# This as the partition definitions managed by azslurm partitions > /sched/azure.conf
Include azure.conf
# If slurm.accounting.enabled=true this will setup slurmdbd
# otherwise it will just define accounting_storage/none as the plugin
Include accounting.conf
# SuspendExcNodes is managed in /etc/slurm/keep_alive.conf
# see azslurm keep_alive for more information.
# you can also remove this import to remove support for azslurm keep_alive
#Include keep_alive.conf
EOF

# Configure Hostname in slurmd.conf
echo "SlurmctldHost=$(hostname -s)" >> "$slurm_conf"

# Create cgroup.conf
cat <<EOF > "$sched_dir/cgroup.conf"
CgroupAutomount=no
ConstrainCores=yes
ConstrainRamSpace=yes
ConstrainDevices=yes
EOF


# Set limits for Slurm
cat <<EOF > /etc/security/limits.d/slurm-limits.conf
* soft memlock unlimited
* hard memlock unlimited
EOF

# Add accounting configuration
echo "AccountingStorageType=accounting_storage/none" >> "$sched_dir/accounting.conf"

# Set permissions and create symlinks

ln -s "$slurm_conf" /etc/slurm/slurm.conf
ln -s "$sched_dir/cgroup.conf" /etc/slurm/cgroup.conf
ln -s "$sched_dir/accounting.conf" /etc/slurm/accounting.conf
ln -s "$sched_dir/azure.conf" /etc/slurm/azure.conf
ln -s "$sched_dir/gres.conf" /etc/slurm/gres.conf 
ln -s "$sched_dir/cgroup_allowed_devices_file.conf" /etc/slurm/cgroup_allowed_devices_file.conf
touch "$sched_dir"/gres.conf "$sched_dir"/azure.conf
chown  slurm:slurm "$sched_dir"/*.conf
chmod 644 "$sched_dir"/*.conf
chown slurm:slurm /etc/slurm/*.conf

# Set up log and spool directories
mkdir -p /var/spool/slurmd /var/spool/slurmctld /var/log/slurmd /var/log/slurmctld
chown slurm:slurm /var/spool/slurmd /var/spool/slurmctld /var/log/slurmd /var/log/slurmctld
echo " "
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Slurm configured"
echo "------------------------------------------------------------------------------------------------------------------------------"