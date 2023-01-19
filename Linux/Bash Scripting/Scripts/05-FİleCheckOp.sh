#! /bin/bash


# Script dosyasını alıştırmak için;
#-----------------------------------
# ./05-FİleCheckOp.sh
# text.txt




#Dosya KOntrol İŞlemleri - Fİle Check Operators
#------------------------------------------------
# -e dosyanın mevcut olup olmadığını gösterir
# -s dosya içeriği dolu mu
# -d dizin olup olmadığını 
# -r -w -x ,z,nleri sorgulamak için kullanılıyor
# -u -g - SUID ve SGID bitlerini kontrol etmek içim kullanılıyor
# -f dosya varsa ve normal bir dosyaysa - Regular file (dizin veya aygıt değil)
# -c dosya varsa ve özel bir karakter dosyası olup olmadığı
# -b dosya varsa ve özel bir blok dosyası olup olmadığı
# -G dosya varsa ve komutu çalıştıran kullanıcıyla aynı gruba sahipse 
# -h dosya varsa ve sembolik bir bağlantı olup olmadığı
#

#Oluşturulma tarihlerini kıyaslama 
# -nt, daha yeni
# -ot, daha eski
# -ef, aynı
#




echo "************************Usage 1************************"
echo -e "Dosya ismini giriniz:\c"     
read FileName

echo "*********************Definition 1*********************"
# Verilen isimde dosyanın varlığı ve içeriği kontrolediliyor
if [[ -e $FileName ]] 
then
	if [[ -s $FileName ]]
	then
		echo "Fİle is exist and full"
	else
		echo "Fİle is exist but empty"
	fi
else
	echo "Fİle is not found "
fi


echo "*********************Definition 2*********************"
# Verilen isimde Regular bir dosyanın varlığı ve varsa komutu çalıştıran kullanıcının yazma yetkisi olup olmadığını kontrol ediyor.
if [[ -f $FileName ]] 
then
	if [[ -w $FileName ]]
	then
		echo "Fİle is exist and writable"
		echo "Add new Text" >> $FileName
		echo "Dosya içeriği: "
		cat $FileName
	else
		echo "Fİle is exist but unwritable"
	fi
else
	echo "Fİle is not found "
fi


echo "*********************Definition 3*********************"
# Verilen isimde dosyanın varlığı ve varsa dosyanın pipe dosyası olup olmadığı kontrol ediliyor
if [[ -e pipeFile ]]
then
	echo "dosya mecvut"
else
	mkfifo pipeFile
fi

if [[ -p pipeFile ]]
then 
	echo "Evet pipe dosyasıyım "
fi


echo "*********************Definition 4*********************"
# Dosyanın doğrudan pipe dosyası olup olmadığı kontrol ediliyor
[[ text.txt -nt pipeFile ]]     
echo $?




echo "************************Usage 2************************"
# Exit komutunun kullanımına örnek bir uyhulama - 
# Exit komutu çalışan shell'den çıkmak için kullanılır. 
# Özetle çıkarken bir hata değeri de döndürerek neden shell'den çıktığını gösterebiliyoruz
FileName="text1.txt"
Error_Not_Found=105

if [[ ! -e $FileName ]]
then
	echo "Dosya bulunamadı"
	exit $Error_Not_Found
fi
#echo $?




echo "************************Usage 3************************"
# file komutunun çıktısıyla dosyanın meta verisindde "gzip compressed date" içeriğini kontrol ediyor ve kontrol çıktısını isGzip değişkenine atıyoruz 
#Üstteki örnekle aynı anda çalıştırılamıyor - ÜSTTEKİ ÖRNEĞİ SİLİP ÇALIŞTIRMALISIN
FileName1="text.txt.gz"
Error_Not_Gzip=110

file $FileName1 | grep "gzip compressed data" 2>&1 >/dev/null; isGzip=$?
echo $isGzip
if [[ $isGzip -ne 0 ]]     #Çıktı True MU kontrolü yapılıyor
then
	echo "Dosya gzip dosyası değildir"
	exit $Error_Not_Gzip
fi

	


#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#Dosya ismini giriniz:file.txt
#
#*********************Definition 1*********************
#
#Fİle is not found 
#
#*********************Definition 2*********************
#
#Fİle is not found 
#
#*********************Definition 3*********************
#
#dosya mecvut
#
#Evet pipe dosyasıyım 
#
#*********************Definition 4*********************
#
#1
#
#************************Usage 2************************
#
#Dosya bulunamadı
#
#
#************************Usage 3************************
#
#1
#
#Dosya gzip dosyası değildir
#

