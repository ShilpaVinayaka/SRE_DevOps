
# Check if a process is running, and if not, restart it.

#!/bin/bash
# Name of the process to check
PROCESS_NAME="my_App"
# Command to start the process
# & is used to run the process in the background
START_COMMAND="/path/to/my_App &"

# Check if the process is running
if  pgrep "$PROCESS_NAME" > /dev/null
then
   echo "$PROCESS_NAME is running."
else            
    echo "$PROCESS_NAME is not running. Starting it..."
    eval $START_COMMAND
fi


# pgrep is used to check if the process is running. 
# If it is not running, the script will execute the command to start the process. You can set this script to run at regular intervals using cron to ensure that your application is always running.

# Check process using ps indtead of pgrep
# Check if the process is running
ps aux | grep "$PROCESS_NAME" | grep -v grep > /dev/null

# restart a service instead of process
systemctl restart my_service

# run this script continuously using cron
# Open the crontab file
crontab -e
# Add the following line to run the script every 1 minute
*/1 * * * * /path/to/your_script.sh 


