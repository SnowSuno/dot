function list_issues_except
    jira issue list \
        -q"project in (INSU, POTI, CAR) AND assignee = currentUser() AND status not in $argv[1]" \
        --plain \
        --columns key,status,summary \
        --no-headers
end

function select_issue_except
    list_issues_except $argv[1] | fzf --height ~100% | awk '{print $1}'
end

function checkout_jira_issue
    echo "Checkout 할 이슈를 선택하세요"
    set -l issue_key (select_issue_except "(Done, Wontfix, Backlog)")


    if git show-branch $issue_key &>/dev/null
        git checkout $issue_key
    else
        git checkout main
        and git pull
        and git checkout -b $issue_key
    end
end

function checkout_jira_issue_from_current_branch
    echo "Checkout 할 이슈를 선택하세요"
    set -l issue_key (select_issue_except "(Done, Wontfix, Backlog)")


    if git show-branch $issue_key &>/dev/null
        git checkout $issue_key
    else
        git checkout -b $issue_key
    end
end

function change_jira_issue_status
    set -l issue_key (select_issue_except "(Done, Wontfix)")
    jira issue move $issue_key
end

function view_current_issue
    jira issue view (git b0) --plain
end

function ji
    switch $argv[1]
        case c checkout
            checkout_jira_issue
        case cc checkout-current
            checkout_jira_issue_from_current_branch
        case m move
            change_jira_issue_status
        case v view
            view_current_issue
        case ls list
            list_issues_except "(Done, Wontfix, Backlog)"
        case ll list-all
            list_issues_except "(Done, Wontfix)"
        case '*'
            echo "Unknown command '$argv[1]'"
    end
end
