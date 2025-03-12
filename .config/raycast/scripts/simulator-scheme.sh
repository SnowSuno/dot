#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Scheme in Simulator
# @raycast.mode silent
# @raycast.packageName Toss
#
# Optional parameters:
# @raycast.icon https://static.toss.im/tds/favicon/apple-touch-icon-152x152.png
# @raycast.argument1 { "type": "dropdown", "data": [{ "title": "supertoss://m/insurance-ads/benefit/intro", "value": "supertoss://m/insurance-ads/benefit/intro" }, { "title": "supertoss://m/insurance-ads", "value": "supertoss://m/insurance-ads/" }], "placeholder": "service" }
# @raycast.argument2 { "type": "text", "placeholder": "some/path", "optional": true }
# @raycast.currentDirectoryPath ~/Repos/toss-frontend
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Write a nice and descriptive summary about your script command here
# @raycast.author Soonho Kwon
# @raycast.authorURL An URL for one of your social medias

if [[ $1 == supertoss* ]]; then
  xcrun simctl openurl booted "$1/$2"
fi

if [[ $1 == servicetoss* ]]; then
  yarn tosscore-cli open "$1/$2"
fi
