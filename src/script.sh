#!/bin/bash

ifconfig | grep inet -m 1

# Activity 1
nmap -sn -n 192.168.56.0/24

# Activity 2
sudo nmap -n -sS 192.168.56.3
sudo nmap -n -sU 192.168.56.3  # his takes like 15 min
# type '?' to see the commands

# Activity 3
nmap -n -O 192.168.56.3 | grep -E "OS|Running"