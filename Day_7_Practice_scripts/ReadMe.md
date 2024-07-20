#Install Docker 
step 1: sudo apt-get update
step 2: sudo apt-get install docker.io
step 3: docker --version
step 4: systemctl status docker
step 5: sudo usermod -aG docker $USER   ==> It will add current usre to docker group (So we can directly use any docker cmd without sudo)
step 6: cat /etc/groups   ==> It will show group and added user in it
step 7: sudo reboot

#Docker Cmd 
1. docke ps   ==> List out the running container
2. docker ps -a    ==> List out all container
3. docker pull <image_name>:<tag>  ==> pull image from docker hub
4. docker images    ==>will list the images
5. docker run -d -e <env_variable>=<password> <image_name>:<tag>    ==> -d indicate the detach mode (run in background) & -e indicate setting environment variable {docker run can download image and run the container}
     1. docker run -d -p <host port no.>:<container port no.> <image_name>:<tag>  ==> -p indicate publish port number (host port number can be change as its your VMs port )
        NOTE: > if we are publisng port then open host port number to the in the security group of EC2 instance
              > To run application in browser use <ip_address of running EC2 instance>:<Host port number>
**Remove docker container
7. docker stop <containe id 1> <container id 2>
8. docker remove/rm <containe id 1> <container id 2>

#To run mysql without download and use in EC2 
1. docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=<password> mysql:latest   => it will run the application 
2. docker exec -it <mysql_Container_id> bash    ==>exec: execute | -it: interactive termial
     --this cammand will open the mysql application
3. mysql -u <root(its by default uname)> -p
4. enter the password =====> you will logged into the mysql interface
5. cmd => show databses;
6. exit     => it will exit user from mysql application
7. again exit      => to exit from container

*************======== Cmd History ===========********************
1  clear
    2  sudo apt-get update
    3  sudo apt-get install docker.io
    4  docker --version
    5  systemctl docker status
    6  systemctl docker status
    7  systemctl status docker
    8  docker ps
    9  whoami
   10  cat /etc/group
   11  sudo usermod -aG docker $USER
   12  cat /etc/group
   13  clear
   14  docker ps
   15  docker reboot
   16  sudo reboot
   17  clear
   18  docker ps
   19  docker exec -it 0710b53e1a40
   20  docker exec -it 0710b53e1a40 bash
   21  clear
   22  history
