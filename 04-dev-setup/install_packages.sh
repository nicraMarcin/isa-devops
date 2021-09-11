#!/bin/bash

DEBIAN_FRONTEND=noninteractive

echo Installing required packages
apt-get update
apt-get install -y vim curl wget make
echo Done