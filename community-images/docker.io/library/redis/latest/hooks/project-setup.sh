#!/usr/bin/env bash

#Lets find our tag
digest=$DIGEST

if [[ -z "$digest" ]]; then
  json_latest_tags=$(curl -s https://hub.docker.com/v2/repositories/library/redis/tags/latest)
  digest=$(echo "$json_latest_tags" | jq -r '.images[] | select(.architecture == "amd64" and .os == "linux") | .last_pushed,.digest' | sort -r | head -n 1)
fi

echo "Digest: $digest"

json_tags=$(
  curl -s https://hub.docker.com/v2/repositories/library/redis/tags?page_size=100 &
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

#---------------------------------------------------------------------------------------------------------

sudo apt install -y --allow-downgrades tcl8.6 tclx
#apt-get update && apt-get install -y build-essential
git clone -b $version https://github.com/redis/redis.git ./repo

if [ ! -d "./repo" ]; then
  echo "Unable to find tag in redis github repository !"
  exit 1
fi

cd ./repo
make
