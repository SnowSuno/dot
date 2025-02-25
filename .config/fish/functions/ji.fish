function list_issues
    jira issue list \
        -q"project in (CAR, INSU, AIT) AND assignee = currentUser() AND status not in (Done, Wontfix)" \
        --plain \
        --columns key,status,summary \
        --no-headers
end

function select_one
    fzf --height ~100% | awk '{print $1}'
end

function select_many
    fzf --multi --height ~100% | awk '{print $1}'
end

function set_branch_description
    set -l branch (git b0)
    git config "branch.$branch.description" (get_ticket_summary $branch)
end

function checkout_jira_issue
    echo "Checkout 할 이슈를 선택하세요"
    set -l issue_key (list_issues | select_one)


    if git show-branch $issue_key &>/dev/null
        git checkout $issue_key
        and set_branch_description
    else
        git checkout main
        and git pull
        and git checkout -b $issue_key
    end
end

function checkout_jira_issue_from_current_branch
    echo "Checkout 할 이슈를 선택하세요"
    set -l issue_key (list_issues | select_one)


    if git show-branch $issue_key &>/dev/null
        git checkout $issue_key
        and set_branch_description
    else
        git checkout -b $issue_key
    end
end

function change_jira_issue_status
    set -l issue_key (list_issues | select_one)
    jira issue move $issue_key
end

function bulk_update
    set -l issue_keys (list_issues | select_many)

    for issue in $issue_keys
        jira issue move $issue Done
    end
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
        case sf set-force
            set_branch_description
        case m move
            change_jira_issue_status
        case done
            bulk_update
        case v view
            view_current_issue
        case ls list
            list_issues
        case '*'
            echo "Unknown command '$argv[1]'"
    end
end
