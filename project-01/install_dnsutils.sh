#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo Installing required packages
apt-get update
apt-get install -y dnsutils
echo Done