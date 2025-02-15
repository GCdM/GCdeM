#!/usr/bin/bash
# Uses brightnessctl to return the current brightness as a fraction of 100
# * currently using 100 for ease of use with Eww. When possible, change to fraction of 1

current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

awk "BEGIN {print ($current_brightness / $max_brightness) * 100}"
