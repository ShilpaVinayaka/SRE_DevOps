# A server’s disk is getting full frequently.
# Find files larger than 100MB

#!/bin/sh

find /var/log -type f -size +100M -mtime +7 -exec ls -lh {} \;

# 🧠 Step-by-step logic

# find → to search files
# -type f → only files
# -size +100M → larger than 100MB
# -mtime +7 → older than 7 days
# -exec ls -lh → human-readable size