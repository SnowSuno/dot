function basename_pwd
    set service_name (basename $PWD)
    set platform (basename (dirname $PWD))

    switch $platform
        case "react-native"
            echo xcrun simctl openurl booted "\"supertoss://m/$service_name/%\""
        case "service.toss.im"
            echo yarn tosscore-cli open "\"$service_name/%\""
        case "*"
            echo "%"           
    end
end


function basename_device_scheme
    set service_name (basename $PWD)
    set platform (basename (dirname $PWD))

    switch $platform
        case "react-native"
            echo device-scheme "\"supertoss://m/$service_name/%\""
        case "service.toss.im"
            echo device-scheme "\"servicetoss://$service_name/%\""
        case "*"
            echo "device-scheme \"%\""
    end
end

abbr -a app --set-cursor --function basename_pwd
abbr -a ssb yarn tosscore-cli deploy:ssb .
abbr -a all yarn workspaces foreach -Ap --include \'\{@tosscore-rn/car-insurance-moment,@tosscore-service/\{auto-insurance,automobile,car-home\},@tosscore/automobile\}\' run 

abbr -a resolve 'git fetch origin main:main && git restore -s main $(git rev-parse --show-toplevel)/{.pnp.cjs,yarn.lock} && yarn'

abbr -a connect 'killport 5037 && adb -s $(adb devices | grep -v devices | head -n 1 | awk \'{print $1}\') reverse tcp:8081 tcp:8081'

abbr -a aos --set-cursor 'adb shell am start -a android.intent.action.VIEW -d "supertoss://m/%"'
abbr -a cluster 'yarn tossrn deploy:cluster --env alpha --from local --package-path . --cluster-id'
abbr -a dv --set-cursor --function basename_device_scheme
