#!/bin/bash
#############################
###    Description: This script is responsible for installing Docker, build mincecraft image
###                 and run it as network host mode
###
#############################

sudo apt-get update

### Docker Installation
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

### Add Docker as super user
sudo usermod -aG docker $USER
newgrp docker

### Build docker image and start server
git clone https://github.com/KevBeltrao/minecraft-create-world-infra.git
cd minecraft-create-world-infra
docker build -t minecraft .
docker container run -d \
    --name minecraft \
    --restart unless-stopped \
    --network host \
    minecraft
