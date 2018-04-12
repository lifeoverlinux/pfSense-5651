#!/bin/sh
#Author: İbrahim Ucar
#Mail: ucribrahim(at)gmail(dot)com
#Site: https://lifeoverlinux.com

log_dizin="/var/log/https_log"

for i in $(ls $log_dizin); do
cat /var/log/https_log/$i | cut -d' ' -f1,2,3,4,5,9,10,11,12 > /var/log/https_calisma/$i && rm /var/log/https_log/$i;
done;

/usr/local/ssl/imzalama/https-trafik-imzalama.sh	
