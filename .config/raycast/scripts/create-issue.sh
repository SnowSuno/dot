#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title 이슈봇
# @raycast.mode compact
# @raycast.packageName Toss
#
# Optional parameters:
# @raycast.icon https://static.toss.im/illusts/issue-bot.png
# @raycast.argument1 { "type": "text", "placeholder": "이슈 제목" }
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Write a nice and descriptive summary about your script command here
# @raycast.author Soonho Kwon
# @raycast.authorURL An URL for one of your social medias

source ~/.config/.env

# normalized=$(python3 -c "import sys, unicodedata; print(unicodedata.normalize('NFC', sys.argv[1]))" "$1")

curl -v -H "Accept: application/json" \
  -H "Content-Type: application/json; charset=utf-8" \
  -X POST \
  -d "{\"summary\":\"$1\"}" \
  $ZAPIER_WEBHOOK_URL >/dev/null

echo "이슈를 생성했어요 🎉"
