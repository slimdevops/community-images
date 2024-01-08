#!/usr/bin/env bash

#Lets find our tag
digest=$DIGEST
version="7.2.3"
sudo apt install -y --allow-downgrades tcl8.6 tclx
#apt-get update && apt-get install -y build-essential
git clone -b $version https://github.com/redis/redis.git ./repo

if [ ! -d "./repo" ]; then
  echo "Unable to find tag in redis github repository !"
  exit 1
fi

cd ./repo
make
