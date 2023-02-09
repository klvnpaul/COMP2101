#!/bin/bash

#check if lxd is installed  and install if not

if ! command -v lxd > /dev/null; then
    sudo apt-get update
    sudo snap install lxd
fi

# Initialize lxd if necessary 
if ! command -v lxdbr0 > /dev/null; then
    sudo lxd init --auto
fi

# initialize he container if it does not exist 
if ! lxd list | grep -q "COMP2101-S22"; then
    lxc launch ubuntu:22.04 COMP2101-S22
fi

# Update /etc/hosts/ with the container if necessary 
if ! lxc exec COMP2101-S22 -- command -v apache2 > /dev/null; then
    lxc exec COMP2101-S22 -- sudo apt-get update
    lxc exec COMP2101-S22 -- sudo apt-get install -y apache2
fi

# Retrieve the default web page from the container's web page 
curl_result=$(curl -s http://COMP2101-S22)

if [ $? -eq 0 ]; then
    echo "Web service is up and running."
else 
    echo "Web service is not running. SOmething went wrong"
fi

