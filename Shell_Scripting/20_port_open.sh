# check if specific port is open on a given server and print OPEN/CLOSED

#!/bin/bash


nc -zv google.com 80 &> /dev/null && echo "OPEN" || echo "CLOSED"
# nc is netcat command, 
# -z is for scanning without sending data, 
# -v is for verbose output, 
# &> /dev/null redirects both stdout and stderr to /dev/null to suppress output. 
# The command returns 0 if the port is open and non-zero if it is closed, which is used in the conditional statement to print OPEN or CLOSED.


# using telnet
telnet google.com 80 &> /dev/null && echo "OPEN" || echo "CLOSED"

# using curl
curl google.com:80 &> /dev/null && echo "OPEN" || echo "CLOSED"

# uing nmap
nmap -p 80 google.com 

# check open ports on your local machine
ss -tuln
netstat -tuln

# check which process is using a specific port
lsof -i :80