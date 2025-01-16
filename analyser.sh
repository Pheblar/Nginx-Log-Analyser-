#!/bin/bash

LOG_FILE="nginx-access.log"

if [ ! -f $LOG_FILE ]; then  
    echo "Log file $LOG_FILE not found!"
    exit 1  
fi

echo "Top 5 IP addresses with the most requests:"
grep -o '^[^ ]*' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5

echo "\nTop 5 most requested paths:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5

echo "\nTop 5 response status codes:"
cut -d' ' -f9 $LOG_FILE | sort | uniq -c | sort -nr | head -n 5