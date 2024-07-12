#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="/root/EBS_logs/log_for_${timestamp}.txt"

#to create file system
yes | sudo mkfs -t ext4 /dev/xvdf >> $log_file 2>&1

#to get availabel bolks
lsblk >> $log_file 2>&1

#to convert block storage to file system
sudo file -s /dev/xvdf >> $log_file 2>&1

#create folder to mount new storage
read -p "Enter the folder name: " foldername
sudo mkdir /mnt/${foldername} >> $log_file 2>&1

#mount attach volumn to instance memory
sudo mount /dev/xvdf /mnt/${foldername} >> $log_file 2>&1

if [ $? -eq 0 ]; then

        echo "Memory sucessfully mounted!!" >> $log_file 2>&1

fi
