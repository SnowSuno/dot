function get_ticket_summary
    curl -s --user "snow.kwon@toss.im:$JIRA_API_TOKEN" "https://tossteam.atlassian.net/rest/api/latest/issue/$argv[1]" | jq ".fields.summary" -r
end

function ticket_name_template
    set --local ticket_name (git b0)
    set --local summary (get_ticket_summary $ticket_name )
    echo "gh pr create --title \"[$ticket_name] %: $summary\" --draft"
end

abbr -a ghpr --set-cursor --function ticket_name_template
