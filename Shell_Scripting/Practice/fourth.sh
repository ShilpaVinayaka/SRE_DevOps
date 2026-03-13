#!/bin/sh

# number of s in "mississippi"

echo "mississippi" | grep -o "s" | wc -l
