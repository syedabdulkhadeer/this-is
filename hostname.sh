#!/bin/bash

#Declaring the servers here
servers= ("192.168.1.11" "192,168.2.39" 192.168.2.22" "192.168.1.120") 

#Declaring the username
username= "ec2-user"

#Looping through the servers 
for server in "${servers[@]}"; do
	echo "Connecting to the $server..."

#Doing SSH to each server and running hostname command
hostname=$(ssh "$username@$server" hostname)

#Checking if the SSH is done or not 
if [$? -eq 0]; then
	echo "Hostname of the $server: $hostname"
else
	echo "Failed to retrive hostname of $server"
fi
done
