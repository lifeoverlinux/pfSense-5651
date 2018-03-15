#!/bin/bash
#ibrahim ucar
#ucribrahim@gmail.com
#lifeoverlinux.com

pid=$(ps -e | pgrep tcpdump | wc -l | xargs echo -n )  

echo "Servis Aranıyor. " 

if [ $pid -eq 0 ] 
then
	sh /usr/local/ssl/imzalama/https-trafik-dinleme.sh 
	echo "Servis yeniden baslatildi."
fi
