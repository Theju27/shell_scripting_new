#!/bin/bash

USERID=$(id -u)
VALIDATE(){
if [ $1 -ne 0 ]; then
	echo "$2....FAILURE"
	exit 1
else
	echo "$2....SUCCESS"
fi
}

if [ $USERID -ne 0 ]; then
	echo "You need to be root user to execute this script"
	exit 1
fi

yum update -y
VALIDATE $? "Updating YUM"

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

VALIDATE $? "Adding Jenkins Repo"

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

VALIDATE $? "Import Jenkins Key"

yum upgrade -y

VALIDATE $? "Upgrade YUM"

dnf install java-17-amazon-corretto -y
VALIDATE $? "Installing OpenJDK 11"

yum install jenkins -y

VALIDATE $? "Installing Jenkins"

systemctl enable jenkins

VALIDATE $? "Enabling Jenkins"

systemctl start jenkins

VALIDATE $? "Starting Jenkins"


