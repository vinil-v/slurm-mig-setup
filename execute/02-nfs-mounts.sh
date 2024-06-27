#!/bin/sh
NFS_SERVER_IP=""
mkdir -p /sched /shared
mount -t nfs $NFS_SERVER_IP:/sched /sched
mount -t nfs $NFS_SERVER_IP:/shared /shared
echo "NFS mounts complete"