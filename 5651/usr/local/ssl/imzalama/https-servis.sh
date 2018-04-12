#!/bin/sh
#Author: İbrahim Ucar
#Mail: ucribrahim(at)gmail(dot)com
#Site: https://lifeoverlinux.com

#######################################################

https_calisma=/var/log/https_calisma 

if [ ! -d $https_calisma ]
    then
        mkdir $https_calisma
        echo "$https_calisma olusturuldu!"
        sleep 1
    fi


https_log=/var/log/https_log

if [ ! -d $https_log ]
    then
        mkdir $https_log
        echo "$https_log olusturuldu!"
        sleep 1
    fi

#######################################################

#First find the process of tcpdump:
pid=$(ps -e | pgrep tcpdump)  
echo $pid

#Then kill them:  
kill -2 $pid

#Sleep 1 second:
sleep 1

#After that run the following necessary command: 
/usr/local/ssl/imzalama/https-trafik-duzenleme.sh
