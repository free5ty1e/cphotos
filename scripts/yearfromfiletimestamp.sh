#!/bin/bash

gphotosregex='Photos from [0-9]{4}'
screenshotregex='[_][0-9]{8}[-]'
regex='[_][0-9]{8}[_]'
if [[ $1 =~ $gphotosregex ]]; then
    # echo "File $1 has a "Photos From XXXX" year stamp in the filename, extracting year from timestamp"
    TIMESTAMP_YEAR=$(echo "$1" | grep -o -m1 'Photos from [0-9]\{4\}' | grep -o -m1 '[0-9]\{4\}' | awk 'NR==1')
elif [[ $1 =~ $screenshotregex ]]; then
    # echo "File $1 has a timestamp in the filename, extracting year from timestamp"
    TIMESTAMP_YEAR=$(echo "$1" | grep -o -m1 '[0-9]\{4\}' | awk 'NR==1')
elif [[ $1 =~ $regex ]]; then
    # echo "File $1 has a timestamp in the filename, extracting year from timestamp"
    TIMESTAMP_YEAR=$(echo "$1" | grep -o -m1 '[0-9]\{4\}' | awk 'NR==1')
else
    # echo "File $1 does not have a timestamp in the filename, extracting year from creation date"
    TIMESTAMP_YEAR=$(stat -c %.4y "$1")
fi
echo "$TIMESTAMP_YEAR"
