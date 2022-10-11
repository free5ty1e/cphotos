#!/bin/bash

echo "Optimizing JPEG image $1 to $2.  If needed, follow instructions here to install jpeg-recompress tool:"
echo "https://github.com/free5ty1e/debianusbfileserver/blob/master/README.md"
nice -20 jpeg-recompress --quality medium --accurate --method smallfry --min 50 "$1" "$2"
