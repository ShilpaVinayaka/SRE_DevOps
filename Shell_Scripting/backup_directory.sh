# Take directory as input and create a backup archive
# adds a timestamp to the backup filename

#!/bin/bash

souce_directory="$1"


timestamp=$(date +"%Y%m%d_%H%M%S")
backup_filename="backup_${timestamp}.tar.gz"

# Create a tar.gz archive of the source directory
# czf is used to create a compressed archive in gzip format
tar -czf "$backup_filename" -C "$source_directory" .

echo "Backup of $source_directory created as $backup_filename"


# how to restore this backup
tar -xzf backup_20230630_123456.tar.gz -C /path

# How to automate this backup every day at 2 AM using cron
crontab -e
0 2 * * * /path/to/backup_directory.sh /path/to/source


# delete backups older than 7 days
find /backup -type f -mtime +7 -delete

