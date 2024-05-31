#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F)
LOG="jenkins-install-${DATE}.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]; then
	echo  -e " $2....${R} FAILURE ${N}" 2>&1 | tee -a $LOG
	Iexit 1
else
	echo -e " $2....${G} SUCCESS ${N}" 2>&1 | tee -a $LOG
fi
}

if [ $USERID -ne 0 ]; then
	echo -e " ${R} You need to be root user to execute this script ${N}"
	exit 1
fi

yum update -y &>>$LOG
VALIDATE $? "Updating YUM"

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo &>>$LOG

VALIDATE $? "Adding Jenkins Repo"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>>$LOG

VALIDATE $? "Import Jenkins Key"

yum upgrade -y &>>$LOG

VALIDATE $? "Upgrade YUM"

dnf install java-17-amazon-corretto -y &>>$LOG
VALIDATE $? "Installing OpenJDK 11"

yum install jenkins -y &>>$LOG

VALIDATE $? "Installing Jenkins" 

systemctl enable jenkins &>>$LOG

VALIDATE $? "Enabling Jenkins"

systemctl start jenkins &>>$LOG

VALIDATE $? "Starting Jenkins"


