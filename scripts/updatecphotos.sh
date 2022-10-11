#!/bin/bash

message="Initiating a cphtos update..."
echo "$message"

pushd ~/cphotos
git fetch
headsha=$(git rev-parse HEAD)
upstreamsha=$(git rev-parse @{u})
if [ "$headsha" != "$upstreamsha" ]
then
    echo "Changes detected upstream!  Updating..."
    git pull
    scripts/installfiles.sh
else
    echo "No changes exist upstream, no need to perform any update operations for this repo!"
fi
popd
