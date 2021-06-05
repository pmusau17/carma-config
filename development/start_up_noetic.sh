#!/bin/bash

# start up background processes 
docker-compose -f docker-compose-background.yml -p carma-background up -d

# start up container
docker-compose -f docker-compose.yml -p carma up   
