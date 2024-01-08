#!/bin/bash

# Script Name: build_run_docker.sh
# Description: This script builds and runs docker image.
# Author: Oleksandr Karpenko, karpen04@ads.uni-passau.de
# Version: 1.0
# SPDX-License-Identifier: MIT
#
# Usage: ./build_run_docker.sh <image_name>

# Check if the image name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <image_name>"
    exit 1
fi


image_name=$1


docker build -t "$image_name" .

# Check if docker image built successfully
if [ $? -eq 0 ]; then
    echo "Docker image '$image_name' built successfully."


    docker run -it --rm "$image_name"
    echo "Docker image '$image_name' is running."
else
    echo "Error: Docker image build failed."
fi
