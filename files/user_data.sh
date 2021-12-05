#!/usr/bin/env bash

yum update
yum install docker -y
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker

yum install git -y

mkdir -p /src/step-project-se

cd /src/step-project-se

git clone https://github.com/Arzu1996/step-project-se.git

cd step-project-se

docker build -t step-project-se:v1.0.0
docker run -di --name step-project-se -p 80:80 step-project-se:v1.0.0



mkdir -p /src/step-project-se-frontend

cd /src/step-project-se-frontend

git clone https://github.com/Arzu1996/step-project-se-frontend.git

cd step-project-se-frontend

docker build -t step-project-se-frontend:v1.0.0
docker run -di --name step-project-se-frontend -p 80:80 step-project-se-frontend:v1.0.0