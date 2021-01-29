#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=testblueimage

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username aycav
docker tag testblueimage aycav/testblueimage
# Step 3:
# Push image to a docker repository
docker push aycav/testblueimage