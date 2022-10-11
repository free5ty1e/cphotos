#!/bin/bash

echo "Installing scripts and other files into their proper locations...."
pushd ~/cphotos
sudo cp -v scripts/*.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/*
popd
