#! /bin/bash
echo "Provisioning machine"

echo "Installing Docker"

echo "Uninstalling previous version..."
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "Setting up the repository"
sudo apt-get update
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Verifying fingerprint"
sudo apt-key fingerprint 0EBFCD88

echo "Setting up stable docker repository"
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "Installing docker engine"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl enable containerd

echo "Installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o ~/docker-compose
chmod +x ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin/docker-compose

echo "PROVISIONING DONE!"

