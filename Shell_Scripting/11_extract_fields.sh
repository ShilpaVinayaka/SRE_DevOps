
# Extract fields from log files
# web server log file format:
# 192.168.1.10 - - [10/Mar/2026:10:15:22] "GET /api/users HTTP/1.1" 200
# 10.0.0.2 - - [10/Mar/2026:10:16:02] "POST /login HTTP/1.1" 401

# Extract IP Address
awk '{print $1}' file.log

# extract http endpoint
awk '{print $7}' file.log

# extract status code
awk '{print $9}' file.log

# eaxtract only failed requests (status code >= 400)
awk '$9 >= 400 {print $0}' file.log
# Output: 10.0.0.2 - - [10/Mar/2026:10:16:02] "POST /login HTTP/1.1" 401

# count number of 500 errors
awk '$9 == 500' file.log | wc -l

# find most requested endpoint
awk '{print $7}' file.log | sort | uniq -c | sort -nr | head
# Output: 150 /index.html

# find requests from a specific IP address
grep "12.3.4.5" file.log

