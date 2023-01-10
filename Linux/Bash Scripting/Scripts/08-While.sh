#! /bin/bash

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
# sleep <Number>     #Beklemek için kullanılan komuttur. Assembly -> NOP gibi


Count=$1
i=0
while [ $i -le $Count ]
do
	echo "Count is $i"
	i=$((i+1))     #((++i)) veya ((i++)) kullanılabilir
done


i=0
while [[ $i != 3 ]]
do
	gnome-terminal &  #CLI açmak için kullanılıyor
	i=$((i+1))
	sleep 1
done


i=0
while (( $i != 2 ))
do
	gnome-terminal -e htop     #CLI'da komut çalıştırmak için kullanılıyor
	i=$((i+1))
	sleep 1
done

