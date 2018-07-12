#!/bin/sh
#Author: İbrahim Ucar
#Mail: ucribrahim(at)gmail(dot)com
#Site: https://lifeoverlinux.com

DATE=`date "+%Y%m%d"`

WORK=/calisma_dizini

if [ ! -d $WORK ]
    then
        mkdir $WORK
        echo "$WORK olusturuldu!"
        sleep 1
    fi

for i in $(ls /var/imzali_kayitlar/ | cut -d'.' -f1,2);
do
echo $i
    cp -a /var/imzali_kayitlar/$i.$DATE* $WORK

done;

/usr/local/ssl/imzalama/ftp.sh

rm -rf /calisma_dizini/*
