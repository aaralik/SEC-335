#!/bin/bash

#variables users must define when running the script

host=$1
port=$2

#append the last number to the IP address, and iterate through .1 to .254
for i in $(seq 1 254); do
    if timeout .1 bash -c "echo >/dev/tcp/$host.$i/$port" 2>/dev/null; then
     echo "$host.$i/$port"
#if the commands finds something then it will print it
    fi 
done
