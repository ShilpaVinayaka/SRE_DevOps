# Take a list of servers/IPs. Ping each server. Prints servers which are UP/DOWN
#!/bin/bash
# Check if the file with server list is provided


servers=("server1" "server2" "server3") # Replace with your server names or IPs
for server in "${servers[@]}"; do
    if ping -c 1 "$server" &> /dev/null; then
        echo "$server is UP"
    else
        echo "$server is DOWN"
    fi
done

# how to check only reachable servers
ping -c 1 google.com && echo "UP"


# check open port instead of ping
nc -zv google.com 80 && echo "Port 80 is open on google.com"
# # nc is netcat, 
# -z is for scanning without sending data, 
# -v is for verbose output, and 80 is the port number to check.