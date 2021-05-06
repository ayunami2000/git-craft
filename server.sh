#!/bin/bash
./ngrok authtoken $NGROK
./ngrok tcp 25565 &
url=$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)
echo $url
java -Xmx4096M -Xms4096M -jar minecraft_server.jar nogui