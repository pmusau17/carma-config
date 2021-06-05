#!/bin/bash
docker container run --rm -v /opt/carma/vehicle/calibration:/opt/carma/vehicle/calibration \
    -v /opt/carma/logs:/opt/carma/logs \
    -v /opt/carma/.ros:/home/carma/.ros \
    -v /opt/carma/vehicle/calibration:/opt/carma/vehicle/calibration \
    -v /opt/carma/yolo:/opt/carma/yolo \
    -v /opt/carma/maps:/opt/carma/maps \
    -v /opt/carma/routes:/opt/carma/routes \
    --net=host \
    -v /opt/carma/data:/opt/carma/data \
    --volumes-from carma-config:ro -it usdotfhwastol/carma-platform:latest bash 

