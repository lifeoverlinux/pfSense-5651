#!/bin/sh
#ibrahim ucar
#ucribrahim@gmail.com

DATE=`date "+%Y%m%d"`

WORK=/calisma_dizini 
 
if [ ! -d $WORK ]
    then
        mkdir $WORK
        echo "$WORK olusturuldu!"
        sleep 1
    fi

cp -a /var/imzali_kayitlar/https.log.$DATE* $WORK
cp -a /var/imzali_kayitlar/dhcpd.leases.$DATE* $WORK
cp -a /var/imzali_kayitlar/dhcpd.log.$DATE* $WORK
cp -a /var/imzali_kayitlar/access.log.$DATE* $WORK

/usr/local/ssl/imzalama/ftp.sh

rm -rf /calisma_dizini/*

