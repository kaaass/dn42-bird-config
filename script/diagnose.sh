#!/bin/bash
set -e

GREEN='0;32'

__color() {
    c=$1
    shift 1
    printf "\033[${c}m$@\033[0m"
}

echo
__color $GREEN "Protocols Status: "
echo 

/usr/bin/birdc show protocols

echo
__color $GREEN "Route to DN42 anycast dns: "
echo 

/usr/bin/birdc show route for 172.20.0.53 all

echo
__color $GREEN "Ping DN42 anycast dns: "
echo 

ping -c 4 172.20.0.53
