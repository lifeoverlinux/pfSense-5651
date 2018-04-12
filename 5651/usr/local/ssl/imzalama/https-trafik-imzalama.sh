#!/bin/sh

#openSSL ve TSA ile log imzalayici (CentOS)
#Author: Cagri Ersen
#cagri(at)cagriersen(dot)net
#http://wwww.syslogs.org
#Surum: 0.1 (08.10.2009)


# DEGISKENLER

# Imzali dosyalara ait tar.gz dosyasinin ismine eklenecek zaman bilgisi.
tarih=`date "+%Y%m%d-%H%M%S"`		

# Imza islemi icin calisma dizinine kopyalanacak log dosyasinin adi.
#dosya_adi=https.log

# Log dosyasinin bulundugu dizin.
yol=/var/log/https_calisma

# Imzalama islerinin yapilacagi dizinin adi.
calisma_dizini=/var/imza_isleri

# Imza sonrasi olusan dosyalarin backuplanacagi dizin.
saklama_dizini=/var/imzali_kayitlar

#Hatali imzalanmis dosyalarin tasinacagi dizin.
hatali_imzalar=/var/imzali_kayitlar/hatali-imza-$dosya_adi-$tarih

# Imzalama sirasinda kullanilan CA private key'e ait public key.
CAPublicKEY=/CA/cacert.pem

# Zaman damgasi otoritesine ait public key.
TSAPublicKEY=/CA/tsacert.pem

# Imzalama sirasinda kullanilan TSA private key'e ait public key.
openssl=/usr/bin/openssl

# Imza islemi icin kullanilacak openssl binarysi.
openssl_conf=/usr/local/ssl/imzalama/openssl.cnf	# OpenSSL binary'sinin kullanacagi config dosyasi.

# TSA'ya ait Private Key'in Pass Pharse'i
password=lifeoverlinux.com

# Hata durumunda gonderilecek bildirim maili'nin gidecegi posta adresinizi girin.
#eposta_adresi=ucribrahim@gmail.com


#--------------------------------------CALISMA DIZININE KOPYALAMA ISLEMI--------------------------------------#

for i in $(ls /var/log/https_calisma/); do ls /var/log/https_calisma/$i;
dosya_adi=$i;
echo "imzalanacak dosya adi:"$dosya_adi;


    if [ ! -d $calisma_dizini ]

	then

			mkdir $calisma_dizini
		
	fi

sleep 1

			cp $yol/$dosya_adi $calisma_dizini

		cd $calisma_dizini


#--------------------------------------IMZALAMA ISLEMI--------------------------------------#
		
            $openssl ts -query -data $dosya_adi -no_nonce -out $dosya_adi.tsq			
sleep 1
            $openssl ts -reply -queryfile $dosya_adi.tsq -out $dosya_adi.der -token_out -config $openssl_conf -passin pass:$password

#--------------------------------------DOGRULAMA ISLEMI--------------------------------------#
			
COMMAND=`$openssl ts -verify -data $dosya_adi -in $dosya_adi.der -token_in -CAfile  $CAPublicKEY -untrusted $TSAPublicKEY`

if [ "$COMMAND" == "Verification: OK" ]

        then

                echo "Dogrulama tamam."
					
        else

                echo "Dogrulama Saglanamadi. Islemler geri aliniyor."

                        if [ ! -d $saklama_dizini ]

                        then

                        mkdir $saklama_dizini

                        fi

				
                            if [ ! -d $hatali_imzalar ]
							
							then
								mkdir $hatali_imzalar
							fi
							
				mv $calisma_dizini/$dosya_adi* $hatali_imzalar
				
echo "$dosya_adi isimli log dosyasi imzalanamadi.
Imza islemi geri alinmis durumda.
Hatali dosyalari $hatali_imzalar dizininde bulabilirsiniz.
Problemin nedenini gormek icin scripti manuel olarak calistirabilirsiniz." | mail -s "Log Imzalayici" "$eposta_adresi"
	
				exit
fi

			
sleep 1 
			
			

	if [ ! -d $saklama_dizini ]

	then

			mkdir $saklama_dizini
	
	fi

sleep 1

			tar cvfz $saklama_dizini/$dosya_adi.$tarih.tar.gz $dosya_adi*
				
sleep 1
	
			rm  $calisma_dizini/$dosya_adi*
			
rm /var/log/https_calisma/$dosya_adi
done;
/usr/local/ssl/imzalama/https-trafik-dinleme.sh	
