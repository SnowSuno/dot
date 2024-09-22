function select_issue
  jira issue list \
    -q"assignee = currentUser() AND statusCategory != Done" \
    --plain \
    --columns key,status,summary \
    --no-headers | fzf --height ~100% | awk '{print $1}'
end

function checkout_jira_issue
  echo "Checkout 할 이슈를 선택하세요"
  set -l issue_key (select_issue)

  
  if git show-branch $issue_key &>/dev/null; 
    git checkout $issue_key 
  else
    git checkout main
    git pull
    git checkout -b $issue_key
  end
end

function change_jira_issue_status
  set -l issue_key (select_issue)
  jira issue move $issue_key
end

function view_current_issue
  jira issue view $(git b0) --plain
end

function ji
  switch $argv[1]
    case c checkout
      checkout_jira_issue
    case m move
      change_jira_issue_status
    case v view
      view_current_issue
    case '*'
      echo "Unknown command '$argv[1]'"
  end
end
