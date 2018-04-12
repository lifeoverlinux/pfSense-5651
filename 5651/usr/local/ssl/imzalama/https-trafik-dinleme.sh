#!/bin/sh
#Author: İbrahim Ucar
#Mail: ucribrahim(at)gmail(dot)com
#Site: https://lifeoverlinux.com

#The following code makes tcpdump command to listen each interfaces of pfsense. Add interfaces into to "for" loop that you want to listen 443 port:

for i in em0 em1 em2 
do
tcpdump -nn -tttt -e -i $i port 443 -q >> /var/log/https_log/https-$i-trafik.log &
done
