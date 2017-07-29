#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo apt-get clean
sudo docker build --rm -t drdotevil18/scratch:hadoop-cluster-1.0.0 .
sudo apt-get clean

echo ""
