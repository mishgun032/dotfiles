#!/usr/bin/env bash

# Wrapper script to open the game splash menu for a given appid

cd $(dirname $(realpath $0))

PLAY=""
OPTIONS=""
LIBRARY=""
ACHIEVEMENTS=""
AK=""
BACK=""

APPID=$1

list-icons() {
    echo $PLAY Play
    echo $AK open on other ACC
    echo $LIBRARY Open in library
    echo $ACHIEVEMENTS Achievements
    echo $BACK Back
}

# See https://developer.valvesoftware.com/wiki/Steam_browser_protocol
# for a list of all commands that can be sent to Steam

handle-option() {
    case $1 in
        "$PLAY")          steam steam://rungameid/$APPID; pgrep picom | xargs kill;;
#		"$AK")			  ./ac.sh $APPID ;;
        "$LIBRARY")       steam steam://nav/games/details/$APPID;;
        "$ACHIEVEMENTS")  steam steam://url/SteamIDAchievementsPage/$APPID;;
        "$BACK")          ./gl-wrapper.sh run;;
    esac
}

SELECTION="$(list-icons | rofi -dmenu -theme ./iconBanner/$APPID)"
handle-option $SELECTION &
#picom &
exit 1;