#!/bin/sh
# Install and configure Slurm
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Installing Slurm"
echo "------------------------------------------------------------------------------------------------------------------------------"
wget https://github.com/Azure/cyclecloud-slurm/releases/download/3.0.6/azure-slurm-install-pkg-3.0.6.tar.gz
tar -xvf azure-slurm-install-pkg-3.0.6.tar.gz
cd azure-slurm-install/slurm-pkgs-rhel8/RPMS/
yum localinstall slurm-*-23.02.7-1.el8.x86_64.rpm -y
cd ~
echo "------------------------------------------------------------------------------------------------------------------------------"
echo "Slurm installed"
echo "------------------------------------------------------------------------------------------------------------------------------"
