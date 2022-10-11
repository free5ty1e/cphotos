#!/bin/bash


echo "Example usage:"
echo "videofixmoovatom.sh \"damaged.mp4\" \"known_good_reference.mp4\""
echo "Need reference video passed as parameter 2 recorded from the same device as the damaged video missing a moov atom.  You passed 1, 2 as follows:"
echo "$1, $2"

if [ -z "$1" ] ; then
    echo "First parameter (damaged.mp4) omitted, cannot continue!"
    exit 9999
fi

if [ -z "$2" ] ; then
    echo "Second parameter (known_good_reference.mp4) omitted, cannot continue!"
    exit 9999
fi

untrunc "$2" "$1"
