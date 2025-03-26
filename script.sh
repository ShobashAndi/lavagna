#!/bin/bash

GREEN='\033[32m'
RED='\033[31m'
RESET='\033[0m'

echo -e "${RED}Building${RESET}"
docker run --rm -it -v "$PWD"/project:/app -w /app maven:3.6.3-openjdk-8 sh -c "mvn clean stampo:build"

echo -e "${RED}Copying Documentation...${RESET}"
cp -r project/target/lavagna/help ./docs

echo -e "${GREEN}Done! Documentation is available in ./docs${RESET}"