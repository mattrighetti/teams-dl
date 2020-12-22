#!/bin/bash

C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_BLUE='\033[0;34m'
C_YELLOW='\033[1;33m'

# println echos string
function println() {
  echo -e "$1"
}

# errorln echos i red color
function errorln() {
  println "${C_RED}${1}${C_RESET}"
}

# successln echos in green color
function successln() {
  println "${C_GREEN}${1}${C_RESET}"
}

# infoln echos in blue color
function infoln() {
  println "${C_BLUE}${1}${C_RESET}"
}

# warnln echos in yellow color
function warnln() {
  println "${C_YELLOW}${1}${C_RESET}"
}

# fatalln echos in red color and exits with fail status
function fatalln() {
  errorln "$1"
  exit 1
}

# print_times prints char specifies at $1 n times (n specifies at $2)
function print_times() {
    str=$1
    num=$2
    v=$(printf "%-${num}s" "$str")
    echo -ne "${v// /${str}}"
}

function prettytime() {
    local minutes=$(( $1 / 60 ))
    local seconds=$(( $1 % 60 ))

    if [[ $minutes -ge 1 ]]; then
        echo -ne "${minutes}m ${seconds}s"
    else 
        echo -ne "${seconds}s"
    fi
}

export -f errorln
export -f successln
export -f infoln
export -f warnln
export -f print_times