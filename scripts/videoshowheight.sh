#!/bin/bash

ffprobe -v error -select_streams v:0 -show_entries stream=height -of default=nw=1:nk=1 "$1"
