#!/bin/bash

<<readme
This script takes backup of given directory 
usage:
./backup.sh <path of directory>
readme

source_dir=$1
#read -p "Please enter path which you woud like to take backup of: " source_dir
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
destination_dir="/home/ubuntu/Scripts/daily_backup"
backup_dir="${destination_dir}/backup_${timestamp}"
log_file="/home/ubuntu/Scripts/logs/log_for_${timestamp}.txt"

function create_backup {

        zip -r "${backup_dir}.zip" "${source_dir}"

        if [ $? -eq 0 ]; then
                echo "Backup created successfully."
        else
                echo "Backup was not created for ${timestamp}"
        fi

}

function perform_rotation {

        #required_backup=$(ls -t "$destination_dir/backup_"*.zip | head -5)
<<cmt      
below cmd explain:
1.ls -t /home/ubuntu/Scripts/daily_backup | sed -e '1,5d' | xargs -d '/n' rm -- > /dev/null
ls -t =>will sort folder as per time
sed -e '1,5d' => Except from 1-5 line data is fw next
xargs -d '/n' rm --  =>Fw line are cosidering /n (-d: is denoted as delimiter)used to seprated as new line and with us                       ing rm -- it will remove all forwoded 
> /dev/null  ==>any output or error will not print on screen 

2.ls -1q "$ {destination_dir}" | wc -l
ls -1q ==> list down 1 file per new line and q is is make op more readable 
wc -l ==> its word count cmd its to count number of line recved from 1s
cmt

        #file_count=$(ls -1q "${destination_dir}" | wc -l)
        file_count=$(ls "${destination_dir}" | wc -l)
        #echo $file_count
        if [ $file_count -gt 5 ]; then
                
                #need to change directory as other user dont have write permission
                cd /home/ubuntu/Scripts/daily_backup

                ls -t | sed -e '1,5d' | xargs -d '\n' rm --

                if [ $? -eq 0 ]; then
                        echo "oldest backup successfully deleted"
                fi

                cd /home/ubuntu/Scripts
            
                #below cmd can be work but due to other user has readd only so not prefer 
                #ls -t /home/ubuntu/Scripts/daily_backup | sed -e '1,5d' | xargs -d '\n' rm -- > /dev/null

        fi

        #required_backup=$(ls -t "$destination_dir")

        #echo "$required_backup[@]"
        echo -e "\n**** List of backup available in Environment ****\n"
        ls -t $destination_dir


}

function delete_old_logs {
        log_folder="/home/ubuntu/Scripts/logs"

        file_count=$(ls "${log_folder}" | wc -l)
        
        if [ ${file_count} -gt 10 ]; then

                cd ${log_folder}

                ls -t | sed -e '1,10d' | xargs -d '\n' rm --

                if [ $? -eq 0 ]; then
                        echo "oldest log files successfully deleted "
                fi

                cd /home/ubuntu/Scripts


        fi

}

create_backup > $log_file 2>&1
perform_rotation >> $log_file 2>&1
delete_old_logs >> $log_file 2>&1
