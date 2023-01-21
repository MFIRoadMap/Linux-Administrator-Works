#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./10-Select.sh 
# 2
# 6
# 1




#Select Kullanımı
#-----------------------------------
#
# select Variable in Val1 Val2 Val3
# do
# 	...
# done
#


# select Variable in Val1 Val2 Val3
# do
# 	case Variable in
#	Val1 )
#		...;;
#	Val2 )
#		...;;
#	Val3 
#		...;;
#	* )
#		...;;
#	esac
# done
#




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
select cities in Mersin Antalya Hatay Malatya
do
	case $cities in
	Mersin )
		echo "Mersin ili seçildi";;
	Antalya )
		echo "Antalya ili seçildi";;
	Hatay )
		echo "Hatay ili seçildi";;
	Malatya )
		echo "Malatya ili seçildi";;
	* )
		echo "LÜtfen geçerli bir sayısal ifade giriniz";;
	esac
done




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#1) Mersin
#
#2) Antalya
#
#3) Hatay
#
#4) Malatya
#
##? 2
#
#Antalya ili seçildi
#
##? 6
#
#LÜtfen geçerli bir sayısal ifade giriniz
#
##? 1
#
#Mersin ili seçildi
#
#