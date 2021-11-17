#!/bin/bash

sudo apt-get update
sudo apt-get install openjdk-8-jdk –y
sudo su
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add - > /tmp.txt
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list> /tmp1.txt
sudo apt-get update
sudo apt-get install jenkins -y --allow-unauthenticated
sudo systemctl start jenkins
sudo ufw allow 8080 > tmp2.txt
sudo ufw allow OpenSSH > tmp3.txt
sudo ufw enable
## install maven 
cd /opt
wgethttp://apache.mirrors.pair.com/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar -xvzf apache-maven-3.6.3-bin.tar.gz
