title=""

function set_date {
    title+="$( date +"%F %R" )"
}

function set_ovpn {
    stateline=$(echo -e 'state\nquit' | nc 127.0.0.1 6001 | tail -n 2 | head -n 1)
    if [[ "$stateline" == "" ]]; then
        title+="VPN Down"
    else
        IFS=, read -a fields <<<"$stateline"
        title+="VPN ${fields[1]}"
    fi
}

function set_ram {
    read -a fields <<< $(free -m | grep Mem)
    title+="${fields[3]} free ${fields[5]} cache"
}

function set_load {
    read -a fields <<< $(cat /proc/loadavg)
    title+="Load ${fields[0]} ${fields[1]} ${fields[2]}"
}

set_ovpn
title+=" | "
set_ram
title+=" | "
set_load
title+=" | "
set_date

xsetroot -name "$title"
