#!/bin/sh
#Author: İbrahim Ucar
#Mail: ucribrahim(at)gmail(dot)com
#Site: https://lifeoverlinux.com

HOST="ip_adresi"
USER="kullanıcı_adi"
PASSWD="parola"

#DATE
DATE=`date "+%Y%m%d"`

cd /calisma_dizini

for file in $(ls $calisma_dizini | cut -d"." -f1-)
do

ftp -inv $HOST << EOT

user $USER $PASSWD
binary
mput $file*
bye
EOT

done;
