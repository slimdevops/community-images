#!/usr/bin/env bash
if [[ "$STAGE" != "FAT" ]]; then
    docker stop wordpress-mysql
    docker rm --force wordpress-mysql
    #docker volume rm wordpress_vol
    sudo rm -rf wordpress_vol
fi

mkdir -p wordpress_vol
docker run --net=host --name wordpress-mysql -p 3306:3306 -e MYSQL_USER=admin -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=exampledb -d mysql:8
