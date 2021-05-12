#!/bin/bash
#./pktriot --config ./pktriot.json start > /dev/null &
ssh -o StrictHostKeychecking=no -i ~/.ssh/ayunalt.git-craft.pem ayunalt.git-craft@portmap.io -f -N -R 23063:localhost:25565 > /dev/null &
echo Starting!
java -Xmx4096M -Xms4096M -jar minecraft_server.jar nogui > /dev/null