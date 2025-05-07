#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Scheme
# @raycast.mode compact
# @raycast.packageName Toss
#
# Optional parameters:
# @raycast.icon https://static.toss.im/tds/favicon/apple-touch-icon-152x152.png
# @raycast.argument1 { "type": "text", "placeholder": "supertoss://" }
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Write a nice and descriptive summary about your script command here
# @raycast.author Soonho Kwon
# @raycast.authorURL An URL for one of your social medias

source ~/.config/.env

message=$(curl -X GET "$PUSH_WEBHOOK_URL/%EB%88%8C%EB%9F%AC%EC%84%9C%20%EC%8A%A4%ED%82%B4%20%EC%97%B4%EA%B8%B0/$(printf "$1" | jq -sRr '@uri')" \
  -d "icon=https://static.toss.im/icons/png/4x/icon-link-fill.png" \
  --data-urlencode "url=$1" \
  -d "group=Toss" | jq '.message' -r)

echo $message
