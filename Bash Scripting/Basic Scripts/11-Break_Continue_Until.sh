#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./11-Break_Continue_Until.sh 




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




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Break kullanımına örnek
for a in  {0..10..1}
do
	if [[ $a -eq 5 ]]
	then
		echo "Nop - Break"
		break
	fi
	echo "$a"
done




echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
# Continue kullanımına örnek
for b in  {0..10..1}
do
	if [[ $b -eq 5 ]]
	then
		echo "Nop-Continue"
		continue
	fi
	echo "$b"
done




echo "************************Usage 3************************"
echo "*********************Definition 1*********************"
# Until kullanımına örnek 
i=1
until [ $i -ge 10 ]
do
	echo "$i"
	(( i++ ))
done




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#0
#
#1
#
#2
#
#3
#
#4
#
#Nop - Break
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#0
#
#1
#
#2
#
#3
#
#4
#
#Nop-Continue
#
#6
#
#7
#
#8
#
#9
#
#10
#
#************************Usage 3************************
#
#*********************Definition 1*********************
#
#1
#
#2
#
#3
#
#4
#
#5
#
#6
#
#7
#
#8
#
#9

