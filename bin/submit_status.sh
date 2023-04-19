url=$DISCORD_ENDPOINT
#Start with RED
color="15548997"
status=$1
content='' #"content": "<@slimdevl>",

[[ "$status" == "success" ]] && {
  color="45973" #Set to Green
  content=""
}


generate_post_data() {
  cat <<EOF
{
  $content
  "embeds": [{
    "title": "$REGISTRY/$NAMESPACE/$REPOSITORY:$TAG",
    "description": "Status: $status\nBranch: $REPO_BRANCH\nCLI Version: $SLIM_CLI_VERSION\nAPI Domain: $API_DOMAIN\nRunner: $ACTION_RUNNER_URL",
    "color": $color
  }]
}
EOF
}

# POST request to The URL
curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data)" $url