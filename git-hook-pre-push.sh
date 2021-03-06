#!/usr/bin/env bash

BLACK="\033[0;30m" RED="\033[0;31m" GREEN="\033[0;32m" YELLOW="\033[0;33m" BLUE="\033[0;34m" PURPLE="\033[0;35m" LIGHT_BLUE="\033[0;36m" WHITE="\033[0;37m" GRAY="\033[0;39m" DEFAULT="\033[0m"
function echo() { command echo -e "$@"; }

[[ -n $FORCE_PUSH ]] && exit 0

echo "${RED}Don't push this repository!${DEFAULT}"
echo "If you want to push this repository, set FORCE_PUSH=1 your environment variable and push!"
exit 1
