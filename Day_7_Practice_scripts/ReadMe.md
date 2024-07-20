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

   ===============================================================================================================================================================================================================================================================

*********************************** Docker Projects **************************************************************************
# 1: Java 

1. add code get from devloper
2. create Dockerfile using {vim Dockerfile}
   Format:
# Get Base image
FROM openjdk:17-jdk-alpine  =======> it will specify which env required to run application , data must be get from devlopers 

#Working dir
WORKDIR /app  ==========>to set working directory to perform any cmd 

#copy codeino the container
COPY src/Main.java /app/Main.java   ===> main source code will copy to working directory

#compile code
RUN javac Main.java       ===>to compile jave fie code 

#Run
CMD ["java","Main"]   ===>the default command to run when the container starts.

3. docker build -t <Image_name>:<version/tag> <working directory>     ==> to buit file to image
Note: Every line we wite in docker file will create layer in docker image

4. docker run <Iamge_name>:<tag>   => run the docker image {Image to application convert}
  or while giving name to container: docker run --name my-running-app java-app:v1 


# 2: Python
1. added flask code in directory
2. create Dockerfile using {vim Dockerfile}
 Format:
# base image
FROM python:3.11     # it will increase the size of application 

#working directory
WORKDIR /app

#copy code in to the container
COPY . /app

#required library
RUN pip install Flask

# run
CMD ["python","app.py"]

3. docker build -t <Image_name>:<Version>
4. docker run -d -p 5000:5000 --name my_flask_app flask-app:latest  ====> it will expose the 5000 port to the application name of the container is my_flask_app


# 3:Node
       cd node
   69  git clone https://github.com/LondheShubham153/node-todo-cicd.git
   70  s
   71  ls
   72  cd node-todo-cicd
   73  ls
   74  cat Dockerfile
   75  vim .dockerignor
   76  docker build -t node-app:latest
   77  docker build -t node-app:latest .
   78  docker images
   79  docker run -d -p 8000:8000 node-app:latest
   80  history

***************************************************************************************************************************************************************************************************************************************************

   
