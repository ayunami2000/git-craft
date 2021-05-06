#!/bin/bash
wget -O minecraft_server.jar https://papermc.io/api/v1/paper/1.16.5/latest/download
#wget https://github.com/ayunami2000/git-craft/raw/master/server.zip
unzip server.zip
echo eula=true>eula.txt
#wget https://github.com/ayunami2000/git-craft/raw/master/pktriot
sudo chmod +x pktriot
echo $PKTRIOT>pktriot.json