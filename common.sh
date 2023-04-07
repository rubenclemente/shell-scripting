#!/usr/bin/env bash


RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
UNDERLINE=$(tput smul)
RESET=$(tput sgr0)


function info() {
    printf "[>] $1\n"
}

function debug() {
	if [ ! -z $DEBUG ] && [ $DEBUG == "true" ]; then
    	printf "${PURPLE}[?] $1${RESET}\n"
	fi
}

function warn() {
    printf "${YELLOW}[!] $1${RESET}\n" >&2
}

function error() {
    printf "${RED}[~] $1${RESET}\n" >&2
}
