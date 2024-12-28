#!/bin/bash 
DOMAIN="zomato.com" 
EXPIRY_DATE=$(openssl s_client -connect $DOMAIN:443 -servername $DOMAIN </dev/null 2>/dev/null | openssl x509 -noout -enddate | sed 's/^notAfter=//') 
EXPIRY_TIMESTAMP=$(date -d "$EXPIRY_DATE" +%s) 
CURRENT_TIMESTAMP=$(date +%s) 
DAYS_LEFT=$(( ($EXPIRY_TIMESTAMP - $CURRENT_TIMESTAMP) / 86400 )) 
 

if [ $DAYS_LEFT -lt 30 ]; then 
    echo "SSL certificate for $DOMAIN expires in $DAYS_LEFT days." | mail -s "SSL Certificate Expiry Alert" admin@example.com 
else 
    echo "SSL certificate for $DOMAIN is valid for $DAYS_LEFT more days." 
fi