#!/bin/bash

FX_ID=$(niri msg --json windows | jq '.[] | select(.app_id == "firefox") | .id' | tail -n 1)

if [ -n "$FX_ID" ]; then
    niri msg action focus-window --id "$FX_ID"
    firefox --new-tab "about:newtab" &
else
    firefox &
fi
