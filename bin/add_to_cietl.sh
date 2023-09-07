#!/bin/bash

# Set the URL you want to post data to
URL= $TRIGGER_URL

# Define the data you want to send in JSON format
DATA='{"registry": "'"$REGISTRY"'", "namespace": "'"$NAMESPACE"'", "repository": "'"$REPOSITORY"'", "digest": "'"$DIGEST"'", "tag": "'"$TAG"'"}'

# Set the content type header
CONTENT_TYPE="application/json"

# Make the POST request using curl
curl -X POST -H "Content-Type: $CONTENT_TYPE" -d "$DATA" "$URL"

