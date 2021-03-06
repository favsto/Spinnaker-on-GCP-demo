#!/bin/bash

COLOR_NONE='\033[0m'
COLOR_BLUE='\033[0;34m'
COLOR_YELLOW='\033[0;33m'
COLOR_RED='\033[0;31m'

echo "--- Bake&Push frontend container image ---"

if [ $# -ne 2 ]
  then
    echo -e "${COLOR_RED}Error. You must specify the project id an the code version number.${COLOR_NONE}"
    echo "Example: ./bake_frontend.sh my-awesome-project 8"
    exit 1
fi

echo -e "${COLOR_BLUE}Changing the version in the source code...${COLOR_NONE}"
VERSION="v$2"
echo -n $VERSION > version
echo -e "${COLOR_YELLOW}Done${COLOR_NONE}"
echo

echo -e "${COLOR_BLUE}Baking image...${COLOR_NONE}"
docker build -t eu.gcr.io/$1/micro-frontend:$VERSION .
echo -e "${COLOR_YELLOW}Done${COLOR_NONE}"
echo

echo -e "${COLOR_BLUE}Pushing image to GCR...${COLOR_NONE}"
docker push eu.gcr.io/$1/micro-frontend:$VERSION
echo -e "${COLOR_YELLOW}Done${COLOR_NONE}"