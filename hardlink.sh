#!/usr/bin/env bash

BLACK="\033[0;30m" RED="\033[0;31m" GREEN="\033[0;32m" YELLOW="\033[0;33m" BLUE="\033[0;34m" PURPLE="\033[0;35m" LIGHT_BLUE="\033[0;36m" WHITE="\033[0;37m" GRAY="\033[0;39m" DEFAULT="\033[0m"
function echo() { command echo -e "$@"; }

cmdcheck() { type >/dev/null 2>&1 "$@"; }
function hardlink() {
	hardlink_ "$@"
	[[ $? == 0 ]] && echo "${GREEN}✔${DEFAULT}" "$@" && return
	echo "${RED}✘${DEFAULT}" "$@" && return 1
}
function hardlink_() {
	[[ $# == 0 ]] && echo "$0 <filepath>" && return 1
	local src_filepath="$1"
	local dst_filepath="./$src_filepath"
	if [[ -f "$src_filepath" ]]; then
		mkdir -p "$(dirname "$dst_filepath")" && ln -f "$src_filepath" "$dst_filepath"
		return 0
	elif [[ -d "$src_filepath" ]]; then
		mkdir -p "$dst_filepath"
		# 		if [[ $(uname -a) =~ "Ubuntu" ]]; then
		# NOTE: don't use directory symbolic link...
		# 			sudo ln -F "$src_filepath" "$dst_filepath"
		# 			return
		# 		elif [[ $(uname) == "Darwin" ]]; then
		cp -r "$src_filepath" "$dst_filepath"
		return
		# 		fi
	fi
	return 1
}

hardlink ~/.ssh

hardlink ~/.local.vimrc

hardlink ~/.local.git_template

hardlink ~/.local.zshenv
hardlink ~/.local.zprofile
hardlink ~/.local.zshrc

hardlink /etc/network/interfaces
hardlink /etc/environment
