#!/bin/bash
# Extract .mp4 video and .jpg still image from a Pixel phone
# camera "motion video" file with a name like MVIMG_20191216_153039.jpg
# to make files like IMG_20191216_153039.jpg and IMG_20191216_153039.mp4
#
# From https://stackoverflow.com/a/59536201/3686125
#
# Usage: googlemotionphotoextract MVIMG_XXX_XXX.jpg 

srcfile="$1"

echo "Extracting .mp4 videos from $srcfile..."
perl -0777 -ne 's/^.*(....ftypmp4.*)$/$1/s && print' "$srcfile" >"${srcfile%.jpg}.mp4";

echo "Removing .mp4 videos from $srcfile, leaving the single .jpg image..."
perl -0777 -pi -e 's/^(.*?)....ftypmp4.*$/$1/s' "$srcfile";

# echo "Checking if we are left with a .jpg at all or was it just an .mp4, if so remove the 0-byte .jpg..."
# if [ -s "$srcfile" ] 
# then
# 	echo "$srcfile has some data.  We have a .jpg, probably, leaving it alone!"
# else
# 	echo "$srcfile is empty, deleting empty file..."
# 	# rm -v "$srcfile"
# fi
