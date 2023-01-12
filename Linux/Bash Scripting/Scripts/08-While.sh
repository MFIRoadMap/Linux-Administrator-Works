#! /bin/bash

#Script dosyasını çalıştırmak için 
#-------------------------------------------
# ./While.sh 

#
#While Kullanımı (sembbollü ==, <=, >= ...)
# while [[ <Condition> ]]
# do
# 	...
# done
#

#
#While Kullanımı (sembbollü ==, <=, >= ...)
# while (( <Condition> ))
# do
# 	...
# done
#

#
#While Kullanımı (kısaltmalı -le, -ge ...). Parantezşer if kullanımıyla aynı
# while [ <Condition> ]
# do
# 	...
# done#
#

#
# while [[] <Condition> ]]
# {
# 	...
# }
#

#
# sleep <Number>     #Beklemek için kullanılan komuttur. Assembly -> NOP gibi


echo "*********************Tanım 1************************"
Count=$1
i=0
while [ $i -le $Count ]
do
	echo "Count is $i"
	i=$((i+1))     #((++i)) veya ((i++)) kullanılabilir
done


echo "*********************Tanım 2************************"
i=0
while [[ $i != 3 ]]
do
	gnome-terminal &  #CLI açmak için kullanılıyor
	i=$((i+1))
	sleep 1
done


echo "*********************Tanım 3************************"
i=0
while (( $i != 2 ))
do
	gnome-terminal -e htop     #CLI'da komut çalıştırmak için kullanılıyor
	i=$((i+1))
	sleep 1
done


echo "*********************Tanım 4************************"
FileName="text.txt"
w=0
cat $FileName | while read line
do 
	echo "$w satır : $line "
	((w=w+1))
done


echo "*********************Tanım 5************************"
echo "dosya while'a atandı"
#dosa uzantısı while döngüsüne verildi
w=0
while read line
do 
	echo "$w satır : $line "
	((w=w+1))
done < $FileName 

