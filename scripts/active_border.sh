#!/bin/bash
/home/robin/scripts/i3subscribe window | while read -r event; do
    i3-msg '[class="^.*"] border none';
    i3-msg 'border pixel 1';
done
