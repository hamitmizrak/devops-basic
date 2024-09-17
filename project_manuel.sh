#!/bin/bash

# Permission
permission() {
    chmod +x Counter.sh
}
permission

# Docker Compose
nginxDocker() {
    # Eğer defaultta: daocker-compose.yml ise
    # docker-compose up
    # docker-compose up -d

    # Nginx-docker-compose.yml
    docker-compose -f Nginx-docker-compose.yml up
    #docker-compose -f Nginx-docker-compose.yml up -d
}
nginxDocker
