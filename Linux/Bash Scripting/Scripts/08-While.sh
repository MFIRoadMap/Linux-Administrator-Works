#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./While.sh 5




#While Kullanımı (sembbollü ==, <=, >= ...)
# while [[ <Condition> ]]
# do
# 	...
# done
#

#While Kullanımı (sembbollü ==, <=, >= ...)
# while (( <Condition> ))
# do
# 	...
# done
#

#While Kullanımı (kısaltmalı -le, -ge ...). Parantezşer if kullanımıyla aynı
# while [ <Condition> ]
# do
# 	...
# done#
#

# while [[] <Condition> ]]
# {
# 	...
# }
#

# sleep <Number>     #Beklemek için kullanılan komuttur. Assembly -> NOP gibi
#



echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Tek köşeli parantez kullanımına örnek
# Aritmetik işlemler doğrudan normal çift parantez içerisinde yapılıyor.
Count=$1
i=0
while [ $i -le $Count ]
do
	echo "Count is $i"
	i=$((i+1))     #((++i)) veya ((i++)) kullanılabilir
done


echo "*********************Definition 2*********************"
# Çift köşeli parantez kullanımına örnek
i=0
while [[ $i != 3 ]]
do
	gnome-terminal &  #CLI açmak için kullanılıyor
	i=$((i+1))
	sleep 1
done


echo "*********************Definition 3*********************"
# Çift normal parantez kullanımına örnek
i=0
while (( $i != 2 ))
do
	gnome-terminal -e htop     #CLI'da komut çalıştırmak için kullanılıyor
	i=$((i+1))
	sleep 1
done


echo "*********************Definition 4*********************"
# Dosya okuma işmei için örnek kullanım
# cat komutunun çıkyısıyla döngüye veriliyor
FileName="text.txt"
w=0
cat $FileName | while read line
do 
	echo "$w satır : $line "
	((w=w+1))
done


echo "*********************Definition 5*********************"
echo "dosya while'a atandı ve satır satır okunuyor."
#dosa uzantısı while döngüsüne verildi
w=0
while read line
do 
	echo "$w satır : $line "
	((w=w+1))
done < $FileName 




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#Count is 0
#
#Count is 1
#
#Count is 2
#
#Count is 3
#
#Count is 4
#
#Count is 5
#
#*********************Definition 2*********************
#
#*********************Definition 3*********************
#
## Option “-e” is deprecated and might be removed in a later version of gnome-terminal.
#
## Use “-- ” to terminate the options and put the command line to execute after it.
#
## Option “-e” is deprecated and might be removed in a later version of gnome-terminal.
#
## Use “-- ” to terminate the options and put the command line to execute after it.
#
#*********************Definition 4*********************
#
#0 satır : filea 
#
#1 satır : fasdfsdfa 
#
#2 satır : fwererfga 
#
#3 satır : tyuyua 
#
#*********************Definition 5*********************
#
#dosya while'a atandı ve satır satır okunuyor.
#
#0 satır : sat1
#
#1 satır : sat2 
#
#2 satır : sat3
#
#3 satır : sat4