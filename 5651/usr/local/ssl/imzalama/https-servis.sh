#!/bin/sh
#ibrahim ucar
#ucribrahim@gmail.com

#443 scriptini durdur.
pid=$(ps -e | pgrep tcpdump)  
echo $pid

#interrupt it:  
kill -2 $pid

sleep 1

/usr/local/ssl/imzalama/https-trafik-duzenleme.sh


