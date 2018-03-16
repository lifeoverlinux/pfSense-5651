#!/bin/sh
#ibrahim ucar
#ucribrahim@gmail.com
#lifeoverlinux.com

#443 scriptini bul.
pid=$(ps -e | pgrep tcpdump)  
echo $pid

#durdur  
kill -2 $pid

sleep 1

/usr/local/ssl/imzalama/https-trafik-duzenleme.sh


