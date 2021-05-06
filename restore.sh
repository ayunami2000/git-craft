#!/bin/bash

sleep 5

#################### RESTORING PREVIOUS WORLD ####################

echo "Getting repository artifacts..."
artifacts=$(curl -s \
	-H "Authorization: token $PAT" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$GITHUB_REPOSITORY/actions/artifacts)

count=`echo $artifacts | jq '.total_count'`

if [ $count = "0" ]
then
#################### INITIAL SETUP ####################


echo "Downloading server jar..."
wget -q https://papermc.io/api/v1/paper/1.16.5/645/download -O server/server.jar

echo "Downloading ngrok..."
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

echo "Extracting ngrok..."
unzip -q ngrok-stable-linux-amd64.zip
cp ngrok server/
sudo chmod +x server/ngrok

echo "Downloading Skript..."
wget -q https://github.com/SkriptLang/Skript/releases/download/2.5.3/Skript.jar -O server/plugins/Skript.jar

else

#################### NORMAL SETUP ####################

archive_url=`echo $artifacts | jq '.artifacts' | jq '.[0]' | jq '.archive_download_url'`
art_url=`echo $artifacts | jq '.artifacts' | jq '.[0]' | jq '.url'`
archive_url="${archive_url//\"/}"
art_url="${archive_url//\"/}"
art_url="${archive_url//\/zip/}"

echo "Getting artifact download url..."
download_url=$(curl \
	-H "Authorization: token $PAT" \
	-H "Accept: application/vnd.github.v3+json" \
	$archive_url -s -k --write-out '%{redirect_url}')

echo "Downloading world.zip..."
wget -q $download_url -O world.zip

echo "Extracting server..."
unzip -f -q world.zip -d server

echo "Deleting old artifact..."
curl -s \
  -X DELETE \
  -H "Authorization: token $PAT" \
  -H "Accept: application/vnd.github.v3+json" \
  $art_url
fi
