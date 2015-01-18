#! /bin/bash

. /home/william/.config/bspwm/bspwm_config.sh

dat (){
	echo -n $(date "+%l:%M // %B %d")
}

ws () {
    monitors=("" "")
    index=0
    status=$(bspc control --get-status)
    status=${status:1}

    IFS=':' read -ra ITEMS <<< "$status"
    for i in "${ITEMS[@]}"; do
        name=${i:1}
        case $i in
            [mM]*)
                if [ "$name" = "DVI-I-1" ]; then
                    index=1
                else
                    index=0
                fi
                ;;
            [FO]*)
                # Currently selected workspaces
                monitors[$index]="${monitors[${index}]}%{B$ACCENT_COLOR}%{F$WHITE}  $name  %{F-}%{B-}"
                ;;
            o*)
                # Active workspace, but not selected
                monitors[$index]="${monitors[${index}]}%{B$BASE_COLOR}%{F$ACCENT_COLOR}  $name  %{F-}%{B-}"

                ;;
            f*)
                # Free workspace
                monitors[$index]="${monitors[${index}]}%{B$BASE_COLOR}%{F$WHITE}  $name  %{F-}%{B-}"
                ;;
        esac
    done

    echo "%{l}${monitors[0]};%{l}${monitors[1]}"
}

lastMailCheck=$(date +%s)
unread=0

updateMail () {
    currTime=$(date +%s)
    if [ $((currTime - lastMailCheck)) -gt 300 ]; then
        unread="$(python /home/william/scripts/gmail.py)"
        lastMailCheck=$(date +%s)
    fi
}

mail () {
    if [ "$unread" != "0" ]; then
        echo "%{B$ALERT_COLOR}%{F$WHITE}  $unread  %{F-}%{B-}" 
    fi
}

logoutBtn () {
    echo "%{A:kill -9 -1:}%{B$ACCENT_COLOR}%{F$WHITE}  logout  %{F-}%{B-}%{A}"
}

while :; do
    updateMail
    IFS=";" read -ra WS <<< "$(ws)" 
    printf "%s\n" "${WS[0]}%{c}$(dat)%{r}$(mail)%{S+}${WS[1]}%{c}$(dat)%{r}$(mail)$(logoutBtn)"
sleep 0.1
done

wait
