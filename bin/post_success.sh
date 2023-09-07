#!/bin/bash

# Set the URL you want to post data to
URL="$TRIGGER_URL"
API_KEY="$LAMBDA_KEY"

# Define the data you want to send in JSON format
DATA='{"fat_image": "'"$PROJECT_FULL_IMAGE_FAT"'", "hardened_image": "'"$PROJECT_FULL_IMAGE_SLIMMED"'"}'

echo "$DATA"

# Set the content type header
CONTENT_TYPE="application/json"

# Make the POST request using curl
curl -X POST -H "Content-Type: $CONTENT_TYPE" -H "x-api-key: $API_KEY" -d "$DATA" "$URL"

