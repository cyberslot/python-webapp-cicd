#!/bin/bash
IMAGE_NAME=cyberslot/app-repo
IMAGE_TAG=python-app-1.0

if [ "$(docker ps -q)" != "" ] 
then 
  echo "There are running containers" 
  echo "Stopping and removing..."
  docker stop $(docker ps -q) && docker rm $(docker ps -aq)
  echo "Deploying..."
  docker run -d -p 5000:5000 $IMAGE_NAME:$IMAGE_TAG
elif [ "$(docker ps -aq)" != "" ]
then 
  echo "There are stopped containers" 
  echo "Removing..."
  docker rm $(docker ps -aq)
  echo "Deploying..."
  docker run -d -p 5000:5000 $IMAGE_NAME:$IMAGE_TAG
else 
  echo "No containers available"
  echo "Deploying..."
  docker run -d -p 5000:5000 $IMAGE_NAME:$IMAGE_TAG
fi
