#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
#./Args.sh Name1 Name2 Name3
# Name1 Name2 Name3
# VMUser
# MyPass
#




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
echo "$1 $2 $3 $0"     #komut sonrası her boşluk arasını bir değişken olarak alır.
echo "$@"     #Komutla girilen bütün değişkeleri gösterir
echo "$#"     #Komutla girilen parametre sayısını gösterir.
echo "$*"     #Komutla girilen bütün değişkeleri gösterir
dizi=("$@")
echo "${dizi[0]} , ${dizi[1]} , ${dizi[2]}"




echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
# Girişlerin parametre olarak verilmesine örnek
echo "Names:"
read -a Args
echo "Names: ${Args[0]} , ${Args[1]} , ${Args[2]}"


echo "*********************Definition 2*********************"
# read komutu parametrelerine örnek
echo "Username:"
read -a Username
echo "Pass:"
read -s Password
echo "Result"
echo "Name $Username , Pass $Password"




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#Name1 Name2 Name3 ./Ex.sh
#
#Name1 Name2 Name3
#
#3
#
#Name1 Name2 Name3
#
#Name1 , Name2 , Name3
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#Names:
#
#unname
#
#Names: unname1 , unname2 , unname3
#
#*********************Definition 2*********************
#
#Username:
#
#VMUser  
#
#Pass:
#
#Result
#
#Name VMUser , Pass MyPass
#
