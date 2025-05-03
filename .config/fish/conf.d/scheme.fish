function select-device
    xcrun devicectl list devices \
        --hide-headers \
        | fzf --height ~100% --select-1 \
        | grep -oE '[A-Fa-f0-9-]{36}' \
        | head -n1
end

function scheme
    set --function uri $argv[1]
    set --function bundle (get-bundle-id $uri)

    xcrun devicectl device process launch \
        --device (select-device) \
        --payload-url $uri \
        $bundle
end

function get-bundle-id
    switch $argv[1]
        case 'supertoss://**' 'servicetoss://**' 'supertoss-alpha://**' 'servicetoss-alpha://**'
            echo 'com.vivarepublica.ent.cash.alpha'
        case 'supertoss-live://**' 'supertoss-live://**'
            echo 'com.vivarepublica.cash'
        case 'showbility://**' 'exp+showbility://**'
            echo 'com.showbility.app.ShowbilityDev'
        case '*'
            echo 'com.apple.mobilesafari'

    end
end

abbr -a sc scheme

abbr -a --command scheme show 'exp+showbility://expo-development-client/?url=http%3A%2F%2F(ipconfig getifaddr en13)%3A8081'
abbr -a --set-cursor --command scheme car 'supertoss://m/car/%'

complete -c scheme -l output -a 'supertoss:// servicetoss://'

# Autocompletions
set -l schemes \
    "supertoss://" \
    "supertoss://m" \
    "supertoss://m/car" \
    "supertoss://m/car/insurance" \
    "servicetoss://" \
    "servicetoss://auto-insurance" \
    "servicetoss://automobile" \
    "servicetoss://automobile/main"

for s in $schemes
    complete -c scheme -f -a $s
end
