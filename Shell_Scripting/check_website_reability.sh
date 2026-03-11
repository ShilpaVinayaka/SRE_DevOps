# check if website is up and running. If not print an alert 

url="http://example.com"

# Use curl to check the website status
# curl will return the HTTP status code of the website. 
# If the status code is 200, it means the website is up and running.
# If it is not 200, it means the website is down.


status_code=$(curl -o /dev/null -s -w "%{http_code}" "$url") 

if [ "$status_code" -ne 200 ]; then
    echo "Alert: Website is down!"
else
    echo "Website is up and running."
fi



# how to run this script every minute using cron
crontab -e
* * * * * /path/to/check_website_reliability.sh

# how to chec response time of the website
response_time=$(curl -o /dev/null -s -w "%{time_total}" "$url")
echo "Response time: $response_time seconds"

# how to check multiple websites
urls=("http://example.com" "http://example2.com" "http://example3.com") 
for url in "${urls[@]}"; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}" "$url") 
    if [ "$status_code" -ne 200 ]; then
        echo "Alert: $url is down!"
    else
        echo "$url is up and running."
    fi
done


