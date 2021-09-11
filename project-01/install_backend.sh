#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo Installing required packages
apt-get update
apt-get install -y python3 git python3-venv vim net-tools
eval `ssh-agent -s`
ssh-add /home/vagrant/.ssh/aws
git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' 
git clone ssh://APKA2BHGYBHS4ACIMPET@git-codecommit.eu-central-1.amazonaws.com/v1/repos/isa-devops-r1-apps
cd isa-devops-r1-apps/services/backend
python3 -m venv venv
source venv/bin/activate
python -m pip install -r requirements.txt
#python scripts/setup_dev.py

# source config.sh && python app.py
export DB_HOST=192.168.100.12 
export DB_PASSWD=root 
export DB_USER=root 
export DB_INSTANCE_NAME=root 
export FLASK_ENV=prod 
python app.py 2>&1 


echo Done