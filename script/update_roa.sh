#!/bin/bash
set -e

BIRD_CONF_DIR=$(dirname "$0")/../

# Root check
if [[ $(id -u) -ne 0 ]]; then
    echo "Run this script with root!" >&2
    exit 1
fi

# Update from: https://dn42.burble.com/services/public/#roa-data
echo "Updating IPv4 roa..."
curl -sfSLR -o$BIRD_CONF_DIR/roa_dn42.conf -z$BIRD_CONF_DIR/roa_dn42.conf https://dn42.burble.com/roa/dn42_roa_bird2_4.conf

echo "Updating IPv6 roa..."
curl -sfSLR -o$BIRD_CONF_DIR/roa_dn42_v6.conf -z$BIRD_CONF_DIR/roa_dn42_v6.conf https://dn42.burble.com/roa/dn42_roa_bird2_6.conf

echo "Re-configuring..."
/usr/sbin/birdc configure

echo "ROA Data updated"
