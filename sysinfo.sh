#!/bin/bash 

# Script to display  important identy information about a computer

# Get FQDN  
echo " " 

echo "INFORMATION ABOUT THE IDENTITY OF THE COMPUTER"

echo " "

fqdn=$(hostname -f)

echo "The fully-qualified DOmain Name: $fqdn" 

# Get the Operating System name and version 

operating_system=$(hostnamectl | grep "Operating System")

echo "$operating_system" 

# Get non-127 IP Adresses 

ip_addresses=$(hostname -I | tr ' ' '\n' | grep -v "^127.")

echo "IP Addresses: $ip_addresses" 

# Get available space in root filesystem
root_space=$(df -h / | tail -l | awk '{print $4}')
echo "Available space in the root filesystem is: $root_space"
#echo "Available space in the root filesystem: $root_space "

#Get the boot id

boot_id=$(cat /proc/sys/kernel/random/boot_id)
echo "THe Boot ID is: $boot_id"

#Get the chassis
chasis=$(cat /sys/class/dmi/id/chassis_vendor)
echo "Chassis: $chasis"

#Get the Kernel
kernel=$(uname -r)
echo "THe kernel is : $kernel"

#Get architechture of the computer

architecture=$(uname -m)
echo "Achitecture : $architecture"

#Get root filesystem status 
root_filesystem=$(df -T / | awk '{if ($1 == "Filesystem") print $2}')

echo "Root filesystem status: $root_filesystem"

echo " "

