#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\e[0;36m'
NC='\033[0m'

echo -e "${CYAN}|> Adding source remote to your git repo...${NC}"
git remote add source "https://github.com/4Viyolite/rbx-project-template"
echo -e "${GREEN}|> Added source remote!${NC}"

echo -e "${CYAN}|> Fetching commits from the source repo...${NC}"
git fetch source
echo -e "${GREEN}|> Fetched commits!${NC}"

echo -e "${CYAN}|> Merging branches...${NC}"
if git merge source/main --allow-unrelated-histories -m "Merge project template from 4Viyolite/rbx-project-template"; then
    echo -e "${GREEN}|> Merged branches!${NC}"
else
    echo -e "${YELLOW}|> Merge encountered conflicts! Please resolve them before running this shell script.${NC}"
fi

echo -e "${CYAN}|> Removing source remote and pushing changes...${NC}"
git remote remove source
git push --force-with-lease
echo -e "${GREEN}|> Done!${NC}"

echo "Template setup is complete."
