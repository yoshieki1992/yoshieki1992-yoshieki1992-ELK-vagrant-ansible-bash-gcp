#!/bin/bash
#Create the Physical Volume
pvcreate /dev/sdb /dev/sdc

# Create Volume group
vgcreate volgrp /dev/sdb /dev/sdc

#Create a thin pool
lvcreate -l 100%FREE -T volgrp/lvpool

#Create Logical Volumes
lvcreate -V 10G -T volgrp/lvpool -n node1 ; lvcreate -V 10G -T volgrp/lvpool -n node2

#Format the thin provisioned logical volumes
mkfs.ext4 /dev/volgrp/node1 ; mkfs.ext4 /dev/volgrp/node2


#Create mount dir
mkdir /mnt/vol1 ; mkdir /mnt/vol2

#Mount point
mount /dev/volgrp/node1 /mnt/vol1/ ; mount /dev/volgrp/node2 /mnt/vol2/

#Generate SSH Key

sudo mkdir /tmp/keys && sudo ssh-keygen -b 2048 -t rsa -f /tmp/keys/vagrant_rsa -q -N ""

cat /home/yoshieki/dev/keys/vagrant_rsa >> ~/.ssh/id_rsa

cat /home/yoshieki/dev/keys/vagrant_rsa.pub >> ~/.ssh/authorized_keys

cat /home/yoshieki/dev/keys/vagrant_rsa >> ~/.vagrant.d/insecure_private_key
