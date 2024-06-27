#!/bin/sh
# Install and configure Munge

munge_key="/etc/munge/munge.key"
sched_dir="/sched"

echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Installing and configuring Munge"
echo "------------------------------------------------------------------------------------------------------------------------------"
yum install -y epel-release
yum install -y munge munge-libs munge-devel
dd if=/dev/urandom bs=1 count=1024 > "$munge_key"
chown munge:munge "$munge_key"
chmod 400 "$munge_key"
systemctl start munge
systemctl enable munge
cp "$munge_key" "$sched_dir/munge.key"
chown munge: "$sched_dir/munge.key"
chmod 400 "$sched_dir/munge.key"
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Munge installed and configured"
echo "------------------------------------------------------------------------------------------------------------------------------"