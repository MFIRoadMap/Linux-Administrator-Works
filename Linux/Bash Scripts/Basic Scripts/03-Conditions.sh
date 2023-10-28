#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# .Conditions.sh <Number>
# .Conditions.sh 1
# .Conditions.sh 20
# .Conditions.sh 200




#Sayı karşılaştırmaları
#------------------------------------
#Tek köşeli parantezle kullanılanlar. 
#Tek köşeli parantez kullanımındaki özellikler aynı kullanım çift köşelide de desteklenşiyor 
#Çift kşeli parantez daha kapsamli özelliklere sahip
# -eq  ->  eşit eşitse     / if[ $a -eq $b ]
# -ne  ->  eşit değilse    / if[ $a -ne $b ]
# -gt  ->  büyükse         / if[ $a -gt $b ]
# -ge  ->  büyük eşitse    / if[ $a -ge $b ]
# -lt  ->  küçükse         / if[ $a -lt $b ]
# -le  *>  küçük eşitse    / if[ $a -le $b ]
#

#Çift köşeli paramtezle kullanılanlar
# ==  ->  eşit eşitse      / if(( $a == $b ))
# >   ->  büyükse          / if(( $a > $b ))
# >=  ->  büyük eşitse     / if(( $a <= $b ))
# <   ->  Küçükse          / if(( $a < $b ))
# <=  ->  Küçük eşitse     / if(( $a <= $b ))
#

#Metin karşılaştırmaları
#------------------------------------
# =   ->  eşitse           / if[ $a = $b ]
# ==  ->  eşitse           / if[ $a == $b ]
# !=  ->  eşit değilse     / if[ $a != $b ]
# >   ->  büyükse (ASCII)  / if[[ $a > $b ]]
# <   ->  küçükse (ASCII)  / if[[ $a < $b ]]
#

#!!!!Köşeli parantezler string işlemleri için kullanılırken !!!!
#!!!!Normal parantezler sayısal işlemler için kullanılıyor!!!!
#

# AND , OR
#-------------------------------------
#Çift köşeli paramtezle kullanılanlar
# &&  -> AND                / if [[ $a && $b ]]   /[[ $a && $b ]]
# -a  -> AND                / if [[ $a -a $b ]]   /[[ $a -a $b ]]
#Tek köşeli parantezle kullanılanlar
# ||  -> OR                 / if [ $a || $b ]   /[ $a || $b ]
# -o  -> OR                 / if [ $a -o $b ]   /[ $a -o $b ]
#

#if - elif - else kullanımı
#-------------------------------------
# if [[ Express1  Condition Express2 ... ]] 
# then
# ...
# fi
#

# if  <Command>     #komut çıktısına bağlı olarak durum True veya False oluyor  
# then
# ...
# fi
#

# if  test (Option) "<Variable>""     
# then
# ...
# fi
#


# if [[ Express1  Condition Express2 ... ]] 
# then
# ...
# elif [[ Express1  Condition Express2 ... ]] 
# then
# ...
# fi
#

# if [[ Express1  Condition Express2 ... ]] 
# then
# 	...
# elif [[ Express1  Condition Express2 ... ]] 
# then
# 	...
# else
# 	...
# fi
#

#NOT : Çift köşeli parantez ve çift köşeli normal parantez kullanmaya özen göster




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Linux sistem çıktılarında  0-> True 1 -> False oluyor 
# "if" kullanılmadan da mantıksal devreler oluşturulabiliyor
(( 0&&1 ))
echo "(( 0&&1 )) işlem durumu: $?"
# 0 olmadığı sürece && işleminin sonucu 0 -> True çıkacaktır
(( 10&&1 ))
echo "(( 10&&1 )) işlem durumu: $?"
echo "---------------------"
#
var=-2 && (( var+=2 ))
echo "var=-2 && (( var+=2 )) işlem durumu: $?"
echo "var=-2 && (( var+=2 )) işlem sonucu: $var"




echo "************************Usage 2************************"
a=1
b=1
c=2
d=Ali
e=Ayse
echo "*********************Definition 1*********************"
# Köşeli çift paramtez kullanımına örnek
if [[ $d < "ceren" ]]
then
	echo "çift köşeli parantez"
fi


# Köşeli tek paramtez kullanımına örnek
if [ $a -eq  $b ]
then
	echo "tek köşeli parantez"
fi


# Normal çift paramtez kullanımına örnek
if (( $c >  1 ))
then
	echo "cift normal parantez - c > 1 "
elif (( $c < 1 ))
	then
		echo "cift normal parantez - c < 1"
else
		echo "cift normal parantez - c = 1"
fi


echo "*********************Definition 2*********************"
 # Karşolo parantez kullanımına örnek
if (( $1 < "10" )) && [ $1 -ge 0 ]
then
	echo "Gİriş yapılan değer < 10"
elif (( $1 > 10 )) && [ $1 -le 100 ]
	then
		echo "100 > Gİriş yapılan değer > 10"
elif (( $1 == 0 ))
	then
		echo "Gİriş yapılan değer = 10 "
else
		echo "Gİriş yapılan değer 0 ila 100 aralığının dışında bir deperdir "
fi


echo "*********************Definition 3*********************"
# Dosya içerisinde anahtar kelime arama
if grep -q Bash file.txt 
then
	echo "file.txt dosyası Bash kelimesi içeriyor"
else
	echo "file.txt dosyası Bash kelimesi içermiyor"
fi


echo "*********************Definition 4*********************"
# Dosya kontrolü için kullanılan test parametreleri"
# Dosya içeriğinin dolu olup olmadığı kontrol ediliyor
# Detayşo bilgi için "man test"
# Metin işlemleri için daha çok çift koçeli parantez kullanılıyor
# Sayısal işlemleri için normal çift parantez kullanılıyor
if [[ -n "$Val" ]]
then
	echo "giriş değeri 0 olan elemanın -n durum çıktısı 0'dir (True)"	
else
	echo "giriş değeri 0 olan elemanın -n durum çıktısı 1'dir (false)"
fi

if [[ -z "$Val" ]]
then
	echo "giriş değeri 0 olan elemanın -z durum çıktısı 0'dir (True)"
else
	echo "giriş değeri 0 olan elemanın -z durum çıktısı 1'dir (False)"	
fi


echo "*********************Definition 5*********************"
# Parantez kullanmadan doğrudan "test" komutuyla kullanım
Varl="asdf"
if test -n "$Val" 
then
	echo "giriş değeri 0 olan elemanın -n durum çıktısı 0'dir (True)"
elif test -z "$val"
then
	echo "giriş değeri 0 olan elemanın -z durum çıktısı 0'dir (True)"	
fi




echo "************************Usage 3************************"
# Çift köşeli parantez içerisinde farklı tabandan ifadeler algılanarak doğrudan karşılaştırılabiliyor (Burada sayıların nasıl tanımlandığı önemli)
decimal=15
octal=017
hex=0x0f

if [[ "$decimal" -eq "$octal" ]]
then
	echo "$decimal eşit $octal"
else
	echo "$decimal eşit değil $octal"
fi


if [[ "$decimal" -eq "$hex" ]]
then
	echo "$decimal eşit $hex"
else
	echo "$decimal eşit değil $hex"
fi




echo "************************Usage 4************************"
# Metin işlemlemlerinin kullanımına birkaç örnek
Name1="Nuri"
Name2="Nuriye"

if [[ $Name1 == $Name2 ]] 
then 
	echo "Name1 eşit Name1 "
fi


if [[ $Name2 == Nuri ]] 
then 
	echo "Name2 eşit Nuri"
fi

if [[ $Name2 == "Nuri*" ]] 
then 
	echo "Name2 eşit \"Nuri*\" "
fi


if [[ $Name2 == Nuri* ]] 
then 
	echo "Name2 eşit Nuri* "
fi

if [[ $Name2 != Nuri* ]] 
then 
	echo "Name2 eşit değil Nuri* "
fi




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#(( 0&&1 )) işlem durumu: 1
#
#(( 10&&1 )) işlem durumu: 0
#
#---------------------
#
#var=-2 && (( var+=2 )) işlem durumu: 1
#
#var=-2 && (( var+=2 )) işlem sonucu: 0
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#çift köşeli parantez
#
#tek köşeli parantez
#
#cift normal parantez - c > 1 
#
#*********************Definition 2*********************
#
#Gİriş yapılan değer < 10
#
#*********************Definition 3*********************
#
#grep: file.txt: No such file or directory
#
#file.txt dosyası Bash kelimesi içermiyor
#
#*********************Definition 4*********************
#
#giriş değeri 0 olan elemanın -n durum çıktısı 1'dir (false)
#
#giriş değeri 0 olan elemanın -z durum çıktısı 0'dir (True)
#
#*********************Definition 5*********************
#
#giriş değeri 0 olan elemanın -z durum çıktısı 0'dir (True)
#
#************************Usage 3************************
#
#15 eşit 017
#
#15 eşit 0x0f
#
#************************Usage 4************************
#
#Name2 eşit Nuri* 