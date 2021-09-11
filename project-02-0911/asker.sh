#!/bin/bash

while true
do
curl -q -s http://nginx.host/status
echo
sleep 5
done