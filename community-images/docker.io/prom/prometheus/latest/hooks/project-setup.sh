#!/usr/bin/env bash

sudo touch /etc/docker/daemon.json
sudo cp -f ./docker-deamon.json /etc/docker/daemon.json
sudo systemctl daemon-reload
sudo systemctl restart docker
