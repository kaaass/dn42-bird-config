#!/bin/bash
set -e

BIRD_CONF_DIR=$(dirname "$0")/../

# Root check
if [[ $(id -u) -ne 0 ]]; then
    echo "Run this script with root!" >&2
    exit 1
fi

# Check param
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 [config name]" >&2
    echo "Enable existing config"
    exit 1
fi
CONF_NAME=$1

# Create conf folder
mkdir -p $BIRD_CONF_DIR/concrete

# Enable config
if [[ -d $BIRD_CONF_DIR/concrete/$CONF_NAME ]]; then
    rm -f $BIRD_CONF_DIR/conf
    ln -s $BIRD_CONF_DIR/concrete/$CONF_NAME $BIRD_CONF_DIR/conf
    echo "Config $CONF_NAME enabled"
    /usr/sbin/birdc configure
    echo "Config $CONF_NAME configured"
else
    echo "Config $CONF_NAME not existed" >&2
    exit 2
fi
