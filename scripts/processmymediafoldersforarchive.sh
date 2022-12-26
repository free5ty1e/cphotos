#!/bin/bash

echo "Changing current folder $(pwd) to /ramdisk as this is where we want to use as our temp / processing / transcoding space..."
pushd "/ramdisk"
echo "Current folder is now $(pwd)"

#If parameter 1 passed, set as BASEFOLDER.  Otherwise, use default
if [[ $1 ]] ; then
    echo "Parameter 1 passed for BASEFOLDER: $1"
    BASEFOLDER="$1"
else
    BASEFOLDER="/media/PiMassive14TbAyy"
fi 
echo "BASEFOLDER is $BASEFOLDER"

processmediafolderforarchive.sh "$BASEFOLDER/SyncthingChrisAndroid/AndroidCamera" "$BASEFOLDER/SyncthingProcessed/ChrisMedia/AndroidCamera"
processmediafolderforarchive.sh "$BASEFOLDER/SyncthingChrisAndroid/PicturesFromApps" "$BASEFOLDER/SyncthingProcessed/ChrisMedia/PicturesFromApps"
processmediafolderforarchive.sh "$BASEFOLDER/Syncthing/CodiDoxBackupSync" "$BASEFOLDER/SyncthingProcessed/CodiMedia"
processmediafolderforarchive.sh "$BASEFOLDER/Syncthing/GooglePixel4aPhotos" "$BASEFOLDER/SyncthingProcessed/GooglePixel4aMedia"

popd