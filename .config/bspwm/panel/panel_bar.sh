#! /bin/bash

. /home/william/.config/bspwm/bspwm_config.sh

dat (){
	hour=$(date "+%l")
	extraspace=""

	if [ $hour -gt 9 ]; then
		extraspace=" "
	fi

	time=$extraspace$(date "+%l:%M - %B %d")
    echo -e "%{T2}%{F$PRIMARY_COLOR}\uf017%{T3}%{F$WHITE}$time "
}

sound (){
	speakerColor="%{F$PRIMARY_COLOR}"
	speakerIcon="%{T2}\uf028"

	levelColor="%{F$WHITE}"
	levelVal=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed -n 's/\([0-9]*\)%/\1/p')
	status=$(awk -F"[][]" '/dB/ { print $6 }' <(amixer sget Master))

	if [ $levelVal -lt 25 ]; then
		speakerIcon="%{T2}\uf027"
	fi

	if [ $levelVal -eq 0 ]; then
		speakerIcon="%{Tw}\uf026"
	fi

	if [ "$status" = "off" ]; then
		levelColor="%{F$ALERT_COLOR}"
		speakerColor="%{F$ALERT_COLOR}"
	fi

	
	level="%{T3}$levelColor$levelVal"
	echo -e "$speakerColor$speakerIcon $level  "
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
                else index=0
                fi
                ;;
            [FO]*)
                # Currently selected workspaces
                prefix="%{T1}%{B$HIGHLIGHT}%{F$BASE_COLOR}%{U$PRIMARY_COLOR}%{+u}"
                suffix="%{-u}%{U-}%{B-}%{F-}"
                monitors[$index]="${monitors[${index}]}$prefix $name $suffix"
                ;;
            o*)
                # Active workspace, but not selected
                prefix="%{T1}%{B$WHITE}%{F$BASE_COLOR}%{U$SECONDARY_COLOR}%{+u}"
                suffix="%{-u}%{U-}%{B-}%{F-}"
                monitors[$index]="${monitors[${index}]}$prefix $name $suffix"
                ;;
            f*)
                # Free workspace
                prefix="%{T1}%{B$WHITE}%{F$BASE_COLOR}%{U$BASE_COLOR}%{+u}"
                suffix="%{-u}%{U-}%{B-}%{F-}"
                monitors[$index]="${monitors[${index}]}$prefix $name $suffix"
                ;;
        esac
    done

	rightArrow="%{F$WHITE}\ue0b0%{F-}"
	leftArrow="%{F$WHITE}\ue0b2%{F-}"
	echo -e "$leftArrow${monitors[0]}$rightArrow;$leftArrow${monitors[1]}$rightArrow"
}

lastMailCheck=$(date +%s)
lastMailCheck=$((lastMailCheck - 298))
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
        echo -e "%{F$PRIMARU_COLOR}%{T2}\uf0e0 %{T3}$unread%{F-}%{B-}  "
    fi
}

while :; do
	updateMail
    IFS=";" read -ra WS <<< "$(ws)" 
	printf "%s\n" "%{c}${WS[0]}%{S+}${WS[1]}%{r}$(mail)$(sound)$(dat) "
	#printf "%s\n" "$(dat)%{c}${WS[0]}%{r}$(mail)%{S+}$(dat)%{c}${WS[1]}"
	#printf "%s\n" "${WS[0]}%{c}$(dat)%{r}$(mail)%{S+}${WS[1]}%{c}$(dat)%{r}$(mail)$(logoutBtn)"
	sleep 0.1
done
