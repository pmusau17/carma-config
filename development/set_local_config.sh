#!/bin/bash
IMAGE_NAME=usdotfhwastol/carma-config:latest
echo $IMAGE_NAME

if docker container inspect carma-config > /dev/null 2>&1; then
    echo "Clearing existing CARMA configuration instance..."
    carma__stop
    echo "Deleting old CARMA config..."
    docker rm carma-config
fi
echo "Setting $IMAGE_NAME as current CARMA configuration instance..."
docker run --name carma-config "$IMAGE_NAME"

echo "Making sure that $IMAGE_NAME has the correct docker-compose-file..."
docker run --rm --volumes-from carma-config:ro --entrypoint sh busybox:latest -c \
        'cat /opt/carma/vehicle/config/docker-compose.yml'