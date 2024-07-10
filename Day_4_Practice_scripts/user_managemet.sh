#!/bin/bash
<<cmt
this script used for:
1. create user 
2. Delete user

based on usecase
cmt

#Create user

#Function to create user
function Create_user {

        read -p "Enter username: " username
        read -p "Enter Password: " password

        sudo useradd -m $username -p $password

        if [ $? -eq 0 ]; then

                echo "user $username is successfully created!!"

                #echo -e "The newly added user from userlist directory:\n$(cat /etc/passwd | tail -1 | awk {print})"
                echo -e "User details: \n$(grep $username /etc/passwd)"
        fi
}

#Delete User

#Function to delete user
function Delete_user {

        read -p "Enter username of which you would like t delete: " uname

        sudo userdel -r $uname

        if [ $? -eq 0 ]; then
     
                echo "User $uname is deleted!!"
        fi
}

for (( i=1 ; i<=2 ; i++ ))
do

        echo -e "What would you like to select\n\t1.Create User.\n\t2.Delete user."

        read -p "Enter 1 or 2 to proceed further: " choise



        case "$choise" in
                1)
                        Create_user
                        ;;
                2)
                        Delete_user
                        ;;
                *)
                        echo "Please select valid option!"
                        ;;
        esac
done
