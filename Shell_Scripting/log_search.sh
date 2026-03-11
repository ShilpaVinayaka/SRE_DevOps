# # Write a shell command/script to find the top 5 IP addresses that made the most requests.

# 192.168.1.10 - - [10/Mar/2026:10:15:22] "GET /api/users HTTP/1.1" 200

awk '{print $1}' /var/log/app.log | sort | uniq -c | sort -nr | head -5

# top endpoint instead of IP address

awk '{print $7}' /var/log/app.log | sort | uniq -c | sort -nr | head -5

# find only 500 errors
grep " 500 " app.log

# counting the total requests
wc -l app.log

