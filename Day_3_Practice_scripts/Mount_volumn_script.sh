#!/bin/bash

<<Note
1.before executing script make sure that EBS volume is created and attached to the instance
2.make sure EBS_logs folder create or make sure /home/ubuntu/EBS_logs path exist
Note

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="/home/ubuntu/EBS_logs/log_for_${timestamp}.txt"

#provide write access to folder to store logs
sudo chmod 744 /home/ubuntu/EBS_logs

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

        echo -e "Memory sucessfully mounted on $(date)\n
        \nHardware details:\n\n
        $(df -h)" >> $log_file 2>&1
        echo "Memory sucessfully mounted!!"

fi
