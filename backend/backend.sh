#!/bin/bash
echo "Spring Boot - Postgresql Dockerize"

# mvn clean package
# mvn clean package -DskipTests

java --version
javac --version

docker-compose -f postgres_docker-compose.yml up -d
