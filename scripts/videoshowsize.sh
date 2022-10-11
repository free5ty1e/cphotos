#!/bin/bash

#Below formats to 1280x720 for example:
#ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$1"

#Below formats to two lines, width=1280 and height=720 for example
ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1 "$1"

#Below formats to two lines, no labels 1280 and 720 for example:
# ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 "$1"
