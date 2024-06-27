#!/bin/sh
# Set up NFS server
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Setting up NFS server"
echo "------------------------------------------------------------------------------------------------------------------------------"
yum install -y nfs-utils
mkdir -p /sched /shared
echo "/sched *(rw,sync,no_root_squash)" >> /etc/exports
echo "/shared *(rw,sync,no_root_squash)" >> /etc/exports
systemctl start nfs-server.service
systemctl enable nfs-server.service
echo "NFS server setup complete"
showmount -e localhost