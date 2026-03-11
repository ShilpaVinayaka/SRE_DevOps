# Find the process consuming the most memory 
# display the pID and process name and kill the process

#!/bin/bash

# Get the process consuming the most memory
most_memory_process=$(ps aux --sort=-%mem | awk 'NR==2 {print $2, $11}')

# ps aux will display all the processes with their memory usage
ps aux --sort=-%mem | head -2

kill -9 $(ps aux --sort=-%mem | head -2 | awk '{print $2}')


# kill -9 is used to forcefully kill the process.
# NR is used to print the second line of the output which contains the process consuming the most memory.


# find the top CPU consuming process
ps aux --sort=-%cpu | head

ps aux --sort=-%cpu | head

# monitor process continuously
top
htop

# memory usage of system
free -h