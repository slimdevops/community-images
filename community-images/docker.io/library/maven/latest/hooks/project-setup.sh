#!/usr/bin/env bash
sudo apt-get -y update
java -version
#sudo apt-get -y install default-jre
#sudo apt-get -y install default-jdk
#java -version
sudo apt-get purge -y --auto-remove openjdk*
sudo apt-get purge -y --auto-remove temurin*
sudo apt-get install -y openjdk-19-jdk
java -version
