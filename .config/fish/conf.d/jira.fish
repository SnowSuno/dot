function get_ticket_summary
    set --local ticket_name (git b0)
    set --local summary (curl -s --user "snow.kwon@toss.im:$JIRA_API_TOKEN" "https://tossteam.atlassian.net/rest/api/latest/issue/$ticket_name" | jq ".fields.summary" -r)
    echo "gh pr create --title \"[$ticket_name] %: $summary\" --draft"
end

abbr -a ghpr --set-cursor --function get_ticket_summary
