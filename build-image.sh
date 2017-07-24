#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t drdotevil18/scratch:hadoop-cluster-1.0.0 .

echo ""
