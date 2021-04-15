#!/bin/bash
set -e

echo "Protocols Status: "
echo 

/usr/bin/birdc show protocols

echo "Route to DN42 anycast dns: "
echo 

/usr/bin/birdc show route for 172.20.0.53 all

echo "Ping DN42 anycast dns: "
echo 

ping -c 4 172.20.0.53
