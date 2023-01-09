#! /bin/bash


#Dosya KOntrol İŞlemleri - Fİle Check Operators
#------------------------------------------------
# -e dosyanın mevcut olup olmadığını gösterir
# -s dosya içeriği dolu mu
# -d dizin olup olmadığını 
# -r -w -x ,z,nleri sorgulamak için kullanılıyor
# -u -g - SUID ve SGID bitlerini kontrol etmek içim kullanılıyor
# -f dosya varsa ve normal bir dosyaysa (dizin veya aygıt değil)
# -c dosya varsa ve özel bir karakter dosyası olup olmadığı
# -b dosya varsa ve özel bir blok dosyası olup olmadığı
# -G dosya varsa ve komutu çalıştıran kullanıcıyla aynı gruba sahipse 
# -h dosya varsa ve sembolik bir bağlantı olup olmadığı


echo -e "Dosya ismini giriniz:\c"     
read FileName


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


