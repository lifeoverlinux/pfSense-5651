#!/bin/sh
#ibrahim ucar
#ucribrahim@gmail.com

HOST="192.168.101.143"
USER="test"
PASSWD="123"
 
#DATE
DATE=`date "+%Y%m%d"`

cd /calisma_dizini

ftp -inv $HOST << EOT
user $USER $PASSWD
binary
mput access.log.$DATE* dhcpd.leases.$DATE* dhcpd.log.$DATE* https.log.$DATE*
bye
EOF
