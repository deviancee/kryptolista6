#!/bin/bash
cookieInjectorScript="cookieInjector.js"
openConsole="xte 'keydown Control_L' 'keydown Shift_L' 'keydown j' 'keyup Control_L' 'keyup Shift_L' 'keyup j'"
openChrome="google-chrome "$2" &"
focusChrome="wmctrl -ia $(wmctrl -lp | grep Chrome | awk '/^[^ ]+ +[^ ]+ +''/ {print $1}')"

eval $openChrome
sleep 1
eval $focusChrome
eval $openConsole
sleep 1

filename=$cookieInjectorScript
while read -r line
do
    eval "xte 'str $line'"
done < "$filename"

xte 'key Return'

xte 'str cookieWriter("'
filename=$1
while read -n10 line; do
    eval "xte 'str $line'"
done < "$filename"
xte 'str ")'
xte 'key Return'
xte 'key F5'
