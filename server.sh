#!/bin/bash
echo Starting!
java -Xmx4096M -Xms4096M -jar minecraft_server.jar nogui > /dev/null &
./pktriot --config ./pktriot.json start
