#!/usr/bin/env bash
docker run --net=host --name drupal-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=test_db -d mysql:8
