# Count number of lines, words, and characters in a file

wc app.log

# count lines
wc -l app.log

# count words
wc -w app.log

# count characters
wc -c app.log

# script version
#!/bin/sh

file="$1"

if [ -f "$file" ]; then
    echo "Lines: $(wc -l < "$file")"
    echo "Words: $(wc -w < "$file")"
    echo "Characters: $(wc -c < "$file")"
else
    echo "File not found!"
fi


# How to count number of error logs
grep -i "error" app.log | wc -l

# count requests from specific IP
grep "192.168.1.1" app.log | wc -l

# count number of files in dir
ls -1 | wc -l

find . -type f | wc -l