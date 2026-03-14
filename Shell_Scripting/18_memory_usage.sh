# Check memory usage. If greater than 80%, print a alert message.

#!/bin/bash

threshold=80
# Get the total memory and used memory
# /mem is the total memory, /used is the used memory
# $3 is the used memory, $2 is the total memory

usage=$(free | awk '/Mem/{printf("%.0f"), $3/$2 * 100}')
if [ "$usage" -gt "$threshold" ]; then
    echo "Memory usage is above $threshold%. Current usage: $usage%"
else
    echo "Memory usage is within limits. Current usage: $usage%"
fi

# top and htop are interactive tools that can be used to monitor memory usage in real-time. You can run these commands in the terminal to see the current memory usage and other system information.
top

htop

# see memory usage per process
ps aux --sort=-%mem | head -n 10
# -%mem sorts the processes by memory usage

# see swap usage
free -h


