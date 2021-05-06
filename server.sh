#!/bin/bash
./pktriot --config ./pktriot.json start &
java -Xmx4096M -Xms4096M -jar minecraft_server.jar nogui