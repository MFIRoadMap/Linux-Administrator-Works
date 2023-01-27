#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./06-SwitchCase.sh value2 A




#Switch-Case Yapısı
#-------------------------------
# case <Variable> in 
#	<Condition> )
#	...;;
#	<Condition> )
#	...;;
#	* )
#	< for Defaulr Case>;;
#esac
#




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Standart switch-case kullanımına örnek
variable1=$1

case  $variable1 in 
	"value1" )
	echo "$variable1 1. durum seçildi";;
	"value2" )
	echo "$variable1 2.durum seçildi";;
	"value3" )
	echo "$variable1 3. durum seçildi";;
	* )
	echo "İstene girişlerden biri değildir";;
esac


echo "*********************Definition 2*********************"
variable2=$2

case  $variable2 in 
	[a-z] )
	echo "$variable2 a-z arasındadır";;
	[A-Z] )
	echo "$variable2 A-Z arasındadır";;
	[0-9] )
	echo "$variable2 0-9 arasındadır";;
	* )
	echo "Yanliş giriş yaptın";;
esac




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#value2 2.durum seçildi
#
#*********************Definition 2*********************
#
#A A-Z arasındadır
#
#