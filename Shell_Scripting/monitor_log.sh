# Continuously monitors a log file if the work ERROR appears. 
# print alert message

# !/bin/bash

# 
log_file="/path/to/logfile.log"
# Continuously monitor the log file for new lines
# tail -F will follow the file even if it is rotated
tail -F "$log_file" | while read line; do
    # Check if the line contains the word "ERROR"
    if [[ "$line" == *"ERROR"* ]]; then
        echo "Alert: ERROR found in log file!"
    fi
done


# count total errors
error_count=$(grep "ERROR" "$log_file" | wc -l)
echo "Total ERROR count: $error_count"

# monitor only last 100 lines
# tail -n is used to read the last n lines of the log file
tail -n 100 "$log_file" | grep "ERROR" | wc -l


# search errors from yesterday
yesterday=$(date -d "yesterday" +"%Y-%m-%d")
grep "ERROR" "$log_file" | grep "$yesterday"

