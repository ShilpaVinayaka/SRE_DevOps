# Check if service is running. If not start the service and print message

#!/bin/bash

service_name="your_service_name"
if systemctl is-active --quiet "$service_name"; then
    echo "$service_name is running"
else
    echo "$service_name is not running. Starting $service_name..."
    systemctl start "$service_name"
fi


# In prod verify after starting
systemctl start nginx

# restart
systemctl restart nginx

#check service status
systemctl status nginx

# enable service to start on boot
systemctl enable nginx