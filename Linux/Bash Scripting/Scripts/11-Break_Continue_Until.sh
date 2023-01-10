#! /bin/bash

#
#
#Break, döngüyü kırmak için kullanılıt
#Continue, döngüdede istenmeyen bir iterasyonu atlamak için kullanılır
#Until,koşul sağlanana kadar işlemleri sürdürmek için kullanılır (For kullanımına benzer).
# 
#UNtil Kullanımı
#---------------------------------------------
# until [ <Condition> ]     #Parantezler if kullanımı gibi
# do
#	...
#done
#
#
#
#
#

echo "*******************Break**********************"
for a in  {0..10..1}
do
	if [[ $a -eq 5 ]]
	then
		echo "Nop - Break"
		break
	fi
	echo "$a"
done




echo "*******************Continue**********************"
for b in  {0..10..1}
do
	if [[ $b -eq 5 ]]
	then
		echo "Nop-Continue"
		continue
	fi
	echo "$b"
done




echo "*******************Until**********************"
i=1
until [ $i -ge 10 ]
do
	echo "$i"
	(( i++ ))
done

