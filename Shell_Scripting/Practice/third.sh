#!/bin/sh

# Print number divisible by 3 and 5 between 1 and 100 and not by 15

for i in {1..100}; do
    if [ $((i % 3)) == 0 ] || [ $((i % 5)) == 0 ] && [ $((i % 15)) != 0 ]; then
        echo $i
    fi
done