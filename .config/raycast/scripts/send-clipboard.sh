#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Send Clipboard
# @raycast.mode compact
# @raycast.packageName Clipboard
#
# Optional parameters:
# @raycast.icon 📋
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Write a nice and descriptive summary about your script command here
# @raycast.author Soonho Kwon
# @raycast.authorURL An URL for one of your social medias

clipboard_content=$(pbpaste)

message=$(curl -X GET "$PUSH_WEBHOOK_URL/Clipboard/$(printf "$clipboard_content" | jq -sRr '@uri')" \
  -d "copy=$clipboard_content" \
  -d "group=Clipboard" | jq '.message' -r)

echo $message
