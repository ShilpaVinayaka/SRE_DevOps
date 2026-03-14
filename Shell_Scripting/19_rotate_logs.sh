# Rotate logs when they exceed a certain size
# checks size of log gile. If greater than 100 MB. Archive the logg and start new empty log file

#!/bin/bash
log_file="/var/log/myapp.log"
max_size=104857600 # 100 MB in bytes

size=$(du -k "$log_file" | cut -f1)

if [ "$size" -gt "$max_size" ]; then

    timestamp=$(date +"%Y%m%d%H%M%S")
    mv "$log_file" "${log_file}.${timestamp}"

    touch "$log_file"
    echo "Log file rotated: ${log_file}.${timestamp}"
else
    echo "Log file size is within limits: $size bytes"
fi

# what tool handles log rotation in Linux?
logrotate

/etc/logrotate.conf is the main configuration file for logrotate. It can include other configuration files from /etc/logrotate.d/ directory. You can create a custom configuration file for your application in /etc/logrotate.d/ to specify how log files should be rotated, compressed, and managed.
daily
rotate 7
compress

# compress rotated logs
gzip ${log_file}.*.gz