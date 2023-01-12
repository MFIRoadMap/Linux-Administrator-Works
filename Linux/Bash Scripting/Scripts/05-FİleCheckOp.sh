#! /bin/bash


# Scriot dısyasunu çalıştırmak için
#-------------------------------------------
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

#Oluşturulma tarihlerini kıyaslama 
# -nt, daha yeni
# -ot, daha eski
# -ef, aynı

echo "*************************Dosya Kontrol Parametreleri****************************"
echo -e "Dosya ismini giriniz:\c"     
read FileName

echo "*************************Tanım 1****************************"
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


echo "*************************Tanım 2****************************"
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



echo "*************************Tanım 3****************************"
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


echo "*************************Tanım 4****************************"
[[ text.txt -nt pipeFile ]]     
echo $?




echo "*************************Exit Kullanımı***********************"
FileName="text1.txt"
Error_Not_Found=105

if [[ ! -e $FileName ]]
then
	echo "Dosya bulunamadı"
	exit $Error_Not_Found
fi
#echo $?




echo "**********************Dosya Formatı Kontrol Etme**************************"
# file komutunun çıktısıyla dosyanın meta verisindde "gzip compressed date" içeriğini kontrol ediyor ve kontrol çıktısını isGzip değişkenine atıyoruz 
#Üstteki örnekle aynı anda çalıştırılamıyoe
FileName1="text.txt.gz"
Error_Not_Gzip=110

file $FileName1 | grep "gzip compressed data" 2>&1 >/dev/null; isGzip=$?
echo $isGzip
if [[ $isGzip -ne 0 ]]     #Çıktı True MU kontrolü yapılıyor
then
	echo "Dosya gzip dosyası değildir"
	exit $Error_Not_Gzip
fi

	



