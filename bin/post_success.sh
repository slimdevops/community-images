#!/bin/bash

# Set the URL you want to post data to
URL="$TRIGGER_URL"

# Define the data you want to send in JSON format
DATA='{"registry": "'"$PROJECT_FULL_IMAGE_FAT"'", "namespace": "'"$PROJECT_FULL_IMAGE_SLIMMED"'", "repository": "'"$PROJECT_TARGET_IMAGE"'", "digest": "'"$PROJECT_ORIGINAL_IMAGE"'", "tag": "'"$TAG"'"}'

echo "$DATA"

# Set the content type header
CONTENT_TYPE="application/json"

# Make the POST request using curl
# curl -X POST -H "Content-Type: $CONTENT_TYPE" -d "$DATA" "$URL"

