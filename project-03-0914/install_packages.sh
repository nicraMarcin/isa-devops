#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y vim curl git net-tools

docker network create todos-net
docker volume create todos-data

cd /tmp/
rm -rf isa-devops
git clone https://github.com/nicraMarcin/isa-devops.git

cd isa-devops/project-03-0914/db
docker build -t todos-db:1.0 .
cd ../backend
docker build -t todos-backend:1 .
cd ../frontend
docker build -t todos-front:1 .

mkdir -p /opt/project && cd /opt/project
rm -rf /tmp/isa-devops

cat <<EOT >> .env.backend
DB_HOST=db.local
DB_PASSWD=root
DB_USER=root
DB_INSTANCE_NAME=project
FLASK_ENV=prod
EOT
cat <<EOT >> .env.db
MYSQL_ROOT_PASSWORD=root
EOT
chown 600 .env*

docker run --rm --net todos-net --name db.local --env-file .env.db -v todos-data:/var/lib/mysql -d todos-db:1.0
docker run --rm --net todos-net --env-file .env.backend --name backend -d todos-backend:1
docker run --rm --net todos-net --name todos-front -p 80:80 -d todos-front:1

echo "DONE"