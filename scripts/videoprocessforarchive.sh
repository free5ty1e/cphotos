#!/bin/bash

echo "Processing video $1 for archival, for storage in location $2 under an appropriate year folder"
echo "(You should provide the first parameter as the filename)"

file="$1"
filename=$(basename "$file")
fname="${filename%.*}"
ext="${filename##*.}"
extcaps=${ext^^}
echo "Processing $file with filename $filename, fname $fname, and ext $extcaps"

case $extcaps in
    'MP4')
        FILE_BASENAME="$filename"

    ;;
    *)
		FILE_BASENAME="$fname.mp4"
    ;;
esac

TEMP_OUTPUT_FILENAME="h265_$FILE_BASENAME"
rm "$TEMP_OUTPUT_FILENAME"
YEAR_FROM_FILENAME=$(yearfromfiletimestamp.sh "$1")
TARGET_FOLDER="$2/$YEAR_FROM_FILENAME"
echo "Year extracted from filename via script: $YEAR_FROM_FILENAME, creating location $TARGET_FOLDER if it does not already exist..."
mkdir -pv "$TARGET_FOLDER"

if videotoh265.sh "$1" "$TEMP_OUTPUT_FILENAME" 1920 34 ; then 
	mv "$TEMP_OUTPUT_FILENAME" "$TARGET_FOLDER/$FILE_BASENAME"
	if test -f "$TARGET_FOLDER/$FILE_BASENAME"; then
	    echo "Transcode appears to have succeeded and target file $TARGET_FOLDER/$FILE_BASENAME exists.  Removing source file and temp file."
	    rm "$1"
	fi
fi
