#!/bin/sh
#ibrahim ucar
#ucribrahim@gmail.com
#lifeoverlinux.com

tcpdump -nn -tttt -e -i em0 port 443 -q >> /var/log/https-trafik.log &

sleep 1

