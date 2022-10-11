#!/bin/bash

if [ -z "$1" ] ; then
    echo "First parameter (source media folder) not present, unable to continue."
    echo "Please provide source media folder as parameter 1 and path to known_good_reference.mp4 as parameter 2 and try again"
    exit 1
fi

if [ -z "$2" ] ; then
    echo "Second parameter (path to known_good_reference.mp4) not present, unable to continue."
    echo "Please provide source media folder as parameter 1 and path to known_good_reference.mp4 as parameter 2 and try again"
    exit 1
fi

echo "Processing media folder $1 - attempting to repair each mp4 here"

if [ ! -d "$1" ] 
then
    echo "Directory $1 DOES NOT exist." 
    exit 9999 # die with error code 9999
fi

if [ ! -f "$2" ] 
then
    echo "Reference file $2 DOES NOT exist." 
    exit 9999 # die with error code 9999
fi

echo "Processing the *.mp4 files directly in $1"
for file in "$1"/*.mp4; do
    videofixmoovatom.sh "$file" "$2"
done

echo "Processing the *.MP4 files directly in $1"
for file in "$1"/*.MP4; do
    videofixmoovatom.sh "$file" "$2"
done
