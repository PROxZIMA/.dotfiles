#!/usr/bin/env bash

to=$1

workspaces=$(hyprctl workspaces -j)

ws_length=$(echo $workspaces | jq '. | length')

next_active_ws=$(echo $workspaces | jq 'last(.[] | select(.windows > 0)).id+1')

if [ $to -le $ws_length ]; then
    hyprctl dispatch workspace $to
else
    hyprctl dispatch workspace $next_active_ws
fi
