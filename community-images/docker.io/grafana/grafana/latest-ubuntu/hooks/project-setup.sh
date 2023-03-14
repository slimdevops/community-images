#!/usr/bin/env bash
rm -rf ./tmp 

digest=$DIGEST

if [[ -z "$digest" ]]; then
  json_latest_tags=$(curl -s https://hub.docker.com/v2/repositories/grafana/grafana/tags/latest-ubuntu)
  digest=$(echo "$json_latest_tags" | jq -r '.images[] | select(.architecture == "amd64" and .os == "linux") | .last_pushed,.digest' | sort -r | head -n 1)
fi

echo "Digest: $digest"

json_tags=$(
  curl -s https://hub.docker.com/v2/repositories/grafana/grafana/tags?page_size=100 &
  page=1
)
name=$(echo "$json_tags" | jq -r '.results[] | select(.images[].digest == "'"$digest"'") | .name')

regex='([0-9]+\.[0-9]+\.[0-9]+)'
if [[ $name =~ $regex ]]; then
  version="${BASH_REMATCH[1]}"
  echo "Extracted redis tag: $version"
else
  echo "Tags Found !"
  exit 1
fi


git clone -b v$version https://github.com/grafana/grafana.git ./tmp 
npm install --quiet -g yarn
