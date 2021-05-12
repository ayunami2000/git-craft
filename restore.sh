#!/bin/bash
wget -O minecraft_server.jar https://papermc.io/api/v1/paper/1.16.5/latest/download
unzip server.zip
wget -O plugins/IllegalStack.jar https://api.spiget.org/v2/resources/44411/download
echo eula=true>eula.txt
unzip -P $PEM ayunalt.git-craft.pem.zip
rm -rf ayunalt.git-craft.pem.zip
mkdir ~/.ssh/
mv ayunalt.git-craft.pem ~/.ssh/
chmod 600 ~/.ssh/ayunalt.git-craft.pem
#sudo chmod +x pktriot
#echo $PKTRIOT>pktriot.json
