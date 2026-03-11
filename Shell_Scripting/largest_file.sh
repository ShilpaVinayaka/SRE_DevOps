# Server disk is full. Write linux command to find the largest file in the system


du -ah / | sort -rh | head -10

# or

find / -type f -exec du -h {} + | sort -rh | head -10

# HIDE PERMISSION DENIED ERRORS
sudo du -ah / 2>/dev/null | sort -rh | head -10