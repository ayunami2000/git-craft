#!/bin/bash

cd server

#################### TUNNEL SETUP ####################

echo "Running ngrok"
./ngrok authtoken $NGROK
./ngrok tcp 25565 &

sleep 5s

url=$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)
echo $url
curl -s \
  -X PATCH \
  -H "Authorization: token $PAT" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/gists/$GIST \
  -d "{\"files\":{\"$GIST_FILE\":{\"content\":\"$url\"}}}" > /dev/null

#################### START MINECRAFT SERVER ####################

echo "Runnning server..."
java -Xmx4096M -Xms4096M -jar server.jar nogui

