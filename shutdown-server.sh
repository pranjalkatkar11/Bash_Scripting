#!/bin/bash 
INACTIVITY_LIMIT=10800  # 3 hours in seconds 
 

# Get last login time 
LAST_ACTIVITY=$(who -u | awk '{print $5}' | cut -d. -f1) 
CURRENT_TIME=$(date +%s) 
INACTIVITY=$(($CURRENT_TIME - $LAST_ACTIVITY)) 
 

if [ $INACTIVITY -ge $INACTIVITY_LIMIT ]; then 
    echo "Server has been inactive for over 3 hours. Shutting down..." 
    shutdown -h now 
else 
    echo "Server is active. No action taken." 
fi