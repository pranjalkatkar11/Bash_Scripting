#!/bin/bash
URL_FILE="/e/urls.txt"
JOBS=10

xargs -n 1 -P "$JOBS" curl -O < "$URL_FILE"

echo "Download completed."