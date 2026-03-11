# shell script to check the CPU usage and alert if greater than 80%

# Get the current CPU idle percentage
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)

# Calculate the current CPU usage percentage
cpu_usage=$((100 - cpu_idle))

# Check if CPU usage is greater than 80%
if [ "$cpu_usage" -gt 80 ]; then
    echo "High CPU usage alert: $cpu_usage%"
else
    echo "CPU usage normal: $cpu_usage%"
fi


# run this every 5 minutes using cron
crontab -e
*/5 * * * * /path/cpu_monitor.sh

# email alert
mail -s "High CPU Usage Alert" user@example.com <<< "CPU usage is above 80%: $cpu_usage%"

# slack alert
curl -X POST -H 'Content-type: application/json' \
 --data '{"text":"High CPU usage alert: '"$cpu_usage"'%"}' \
 https://hooks.slack.com/services/T00000000/B00000000/
 

