# A server’s disk is getting full frequently.
# Find files larger than 100MB

#!/bin/bash

find /var/log -type f -size +100M -mtime +7 -exec ls -lh {} \;
