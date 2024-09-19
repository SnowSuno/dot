function device-scheme
    if not set -q argv[1]
        echo 'Scheme not provided'
    else
        echo -n 'Sending scheme to device...'
        set response_message $(curl -s -X GET "$BARK_WEBHOOK_URL/$(printf "$argv[1]" | jq -sRr '@uri')" \
          -d"icon=https://static.toss.im/icons/png/4x/icon-link-fill.png" \
          --data-urlencode "url=$argv[1]" \
          -d "group=Toss" | jq '.message' -r)

        echo $response_message
    end
end
