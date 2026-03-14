# Check disk usage if greater than 80% then print alert message

df -h

# output:
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/sda1        50G   40G  10G  80% /

#!/bin/bash
THRESHOLD=80
# Get the disk usage percentage for the root partition
# sed 's/%//' is used to remove the percentage sign from the output
# tail -1 is used to get the last line of the output which contains the disk usage information
usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$usage" -gt "$THRESHOLD" ]; then
  echo "Alert: Disk usage is at ${usage}%"
else
  echo "Disk usage is at ${usage}%, which is below the threshold."
fi


# check all filesystems
# df -h | grep '^/dev' will show the disk usage for all mounted filesystems that are
# based on physical devices (like hard drives). 
# This command filters out virtual filesystems and other non-physical mounts, 
# providing a clearer view of the actual disk usage on the system.
df -h | grep '^/dev'

# send alert message
echo "Disk usage high" | mail -s "Disk Usage Alert" admin@example.com

# run cron every 5 minutes
*/5 * * * * /path/to/disk_usage_check.sh

# explain cron syntax
# * * * * * command to execute
# - - - - -
# | | | | |
# | | | | ----- Day of the week (0 - 7) (Sunday is
# | | | ------- Month (1 - 12)
# | | --------- Day of the month (1 - 31)
# | ----------- Hour (0 - 23)
# ------------- Minute (0 - 59)     
# Example for 5 min 5 hours, 4 days 3 months and 2 days of week
# */5 5 4 3 2 /path/to/disk_usage_check.sh

