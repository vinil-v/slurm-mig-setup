#!/bin/sh
# Install and configure Munge

munge_key="/etc/munge/munge.key"
sched_dir="/sched"

echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Installing and configuring Munge"
echo "------------------------------------------------------------------------------------------------------------------------------"
yum install -y epel-release
yum install -y munge munge-libs munge-devel
cp $sched_dir/munge.key /etc/munge
chown munge:munge "$munge_key"
chmod 400 "$munge_key"
systemctl start munge
systemctl enable munge
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Munge installed and configured"
echo "------------------------------------------------------------------------------------------------------------------------------"