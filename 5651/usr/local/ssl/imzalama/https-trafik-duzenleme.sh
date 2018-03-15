#!/bin/sh
#ibrahim ucar
#ucribrahim@gmail.com

#Duzenleme
cat /var/log/https-trafik.log | cut -d' ' -f1,2,3,4,5,9,10,11,12 > /var/log/https.log 

sleep 1

/usr/local/ssl/imzalama/https-trafik-imzalama.sh	
