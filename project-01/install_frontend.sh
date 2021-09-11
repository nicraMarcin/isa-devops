#!/bin/bash
set -x

export DEBIAN_FRONTEND=noninteractive

echo Installing required packages
apt-get update
apt-get install -y git nginx vim curl
curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install -y nodejs
eval `ssh-agent -s`
su - vagrant
ssh-add /home/vagrant/.ssh/aws
git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' 
git clone ssh://APKA2BHGYBHS4ACIMPET@git-codecommit.eu-central-1.amazonaws.com/v1/repos/isa-devops-r1-apps
cd isa-devops-r1-apps/services/frontend
npm install
npm run build
cat /home/vagrant/nginx/nginx.conf > /etc/nginx/sites-available/default

systemctl restart nginx

echo Done