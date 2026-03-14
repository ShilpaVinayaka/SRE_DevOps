# linux command to find the top 5 most frequently used commands from user's shell history


history | awk '{print $2}' | sort | uniq -c | sort -rn | head -5

# alternative using bash_history
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -rn | head -5


# clear history
history -c


# search hsistory
history | grep "search_term"

