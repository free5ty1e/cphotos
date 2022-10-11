#!/bin/bash

#If parameter 1 passed, set as BASEFOLDER.  Otherwise, use default
if [[ $1 ]] ; then
    echo "Parameter 1 passed for BASEFOLDER: $1"
    BASEFOLDER="$1"
else
    BASEFOLDER="/media/MassiveSto8TbAyy"
fi 
echo "BASEFOLDER is $BASEFOLDER"

fixmp4atomsinfolder.sh "$BASEFOLDER/SyncthingChrisAndroid/AndroidCamera/Camera" "$BASEFOLDER/SyncthingProcessed/Reference/OnePlus6Mp4/spotrefvid.mp4"
