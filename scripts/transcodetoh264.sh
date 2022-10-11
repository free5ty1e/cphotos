#!/bin/bash

FOLDER_DEFAULT="."
FILE_EXTENSION_DEFAULT="mpg"

if [ -z "$*" ] ; then
	FOLDER="$FOLDER_DEFAULT"
	echo "First parameter (FOLDER) omitted, using default of $FOLDER"
else
	FOLDER="$1"
	echo "First parameter (FOLDER) provided: $FOLDER"
fi

if [ -z "$2" ] ; then
	FILE_EXTENSION="$FILE_EXTENSION_DEFAULT"
	echo "Second parameter (FILE_EXTENSION, such as mpg) omitted, using default of $FILE_EXTENSION"
else
	FILE_EXTENSION="$2"
	echo "Second parameter (FILE_EXTENSION, such as mpg) provided: $FILE_EXTENSION"
fi

message="Transcoding $FILE_EXTENSIONs recursively in $FOLDER to h.264 .mp4 format video and removing each original as they succeed..."
echo "$message"
cowsay -f eyes "$message"

find . -name "*.$FILE_EXTENSION" -exec sh -c 'nice -n19 "avconv -i $1 -c:v libx264 ${1%.$FILE_EXTENSION}.mp4 && rm $1"' _ {} \;

echo "
----------------------------------------------------------------------
TRANSCODING COMPLETE!
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------

"
