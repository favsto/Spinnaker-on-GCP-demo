#!/bin/bash

COLOR_NONE='\033[0m'
COLOR_BLUE='\033[0;34m'
COLOR_YELLOW='\033[0;33m'
COLOR_RED='\033[0;31m'

echo "--- Commit&Push backend versioned code ---"

if [ $# -ne 1 ]
  then
    echo -e "${COLOR_RED}Error. You must specify the project id an the code version number.${COLOR_NONE}"
    echo "Example: ./commit_backend.sh 8"
    exit 1
fi

echo -e "${COLOR_BLUE}Changing the version in the source code...${COLOR_NONE}"
echo "v$1" > version
echo -e "${COLOR_YELLOW}Done${COLOR_NONE}"
echo

echo -e "${COLOR_BLUE}Push code...${COLOR_NONE}"
git add . 
git commit -m "push of veresion $1"
git push
echo -e "${COLOR_YELLOW}Done${COLOR_NONE}"
echo