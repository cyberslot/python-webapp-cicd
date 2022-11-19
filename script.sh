if [ "$(docker ps -q)" != "" ]; then
    docker stop $(docker ps -q) && docker rm $(docker ps -aq)
else
    docker run -d -p 5000:5000 $IMAGE_NAME:$IMAGE_TAG
fi
