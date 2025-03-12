#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Quick Create
# @raycast.mode compact
# @raycast.packageName Jira
#
# Optional parameters:
# @raycast.icon https://static-00.iconduck.com/assets.00/jira-icon-512x512-z7na7dot.png
# @raycast.argument1 { "type": "text", "placeholder": "Issue Summary" }
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Write a nice and descriptive summary about your script command here
# @raycast.author Soonho Kwon
# @raycast.authorURL An URL for one of your social medias

source ~/.config/raycast/scripts/.env

ticket_number=$(curl -s --request POST \
  --url "$JIRA_BASE_URL/rest/api/3/issue" \
  --user $JIRA_USER_TOKEN \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data "{
  \"fields\": {
    \"assignee\": {
      \"id\": \"$JIRA_USER_ID\"
    },
    \"project\": {
      \"id\": \"$JIRA_PROJECT_ID\"
    },
    \"reporter\": {
      \"id\": \"$JIRA_USER_ID\"
    },
    \"summary\": \"$1\",
    \"issuetype\": {
      \"id\": \"10001\"
    }
  },
  \"update\": {}
}" | jq '.key' -r)

echo $ticket_number
