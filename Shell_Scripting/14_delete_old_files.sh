# Find files in a directory that are older than  days and delete them automatically

find /var/log -type f -mtime +7 -delete

# Explanation:
# - `find`: The command used to search for files in a directory hierarchy.
# - `/var/log`: The directory to search in. You can replace this with any directory
# - `-type f`: This option tells `find` to look for files only (not directories).
# - `-mtime +7`: This option tells `find` to look for files that were last modified more than 7 days ago. You can adjust the number of days as needed.
# - `-delete`: This option tells `find` to delete the files that match the criteria. Be cautious when using this option, as it will permanently delete files without confirmation. Always test your `find` command without `-delete` first to ensure it is selecting the correct files.


# check before deleting files
find /var/log -type f -mtime +7 

# often logs are compressed before deletion
find /var/log -type f -mtime +7 -exec gzip {} \; -delete

# run daily cleanup at 3 AM
0 3 * * * find /var/log -type f -mtime +7 -delete

