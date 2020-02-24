#!/bin/bash

sudo useradd challenge

sudo usermod -aG wheel challenge

sudo sh -c "echo 'challenge ALL=NOPASSWD: ALL' >> /etc/sudoers"

sudo cp -r /home/vagrant/.ssh /home/challenge/.ssh

sudo chown -R challenge:challenge /home/challenge/.ssh

sudo chmod 700 /home/challenge/.ssh 

sudo mkdir /mnt/vol1 ; sudo mkfs.ext4 -F /dev/sdb ; sudo mount /dev/sdb /mnt/vol1/ 
