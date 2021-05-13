#!/bin/bash
#./pktriot --config ./pktriot.json start > /dev/null &
ssh -o StrictHostKeychecking=no -i ~/.ssh/ayunalt.git-craft.pem ayunalt.git-craft@portmap.io -f -N -R 23063:localhost:25565
echo Starting!
{
    sleep 5h
    pkill java
    rm -rf minecraft_server.jar
} &
for i in {1..10}; do
    java -Xmx4096M -Xms4096M -jar minecraft_server.jar nogui > /dev/null
    sleep 1s
    echo Crash $1/10
done