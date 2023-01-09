#! /bin/bash


#./Args.sh Name1 Name2 Name3

#---------------------------------

echo "$1 $2 $3 $0"     #komut sonrası her boşluk arasını bir değişken olarak alır.
echo "$@"     #Komutla girilen bütün değişkeleri gösterir
echo "$#"     #Komutla girilen parametre sayısını gösterir.
echo "$*"     #Komutla girilen bütün değişkeleri gösterir
dizi=("$@")
echo "${dizi[0]} , ${dizi[1]} , ${dizi[2]}"


#./Args.sh
#Name1 Name2 Name3
#--------------------------------
echo "Names:"
read -a Args
echo "Names: ${Args[0]} , ${Args[1]} , ${Args[2]}"


echo "Username:"
read -a Username
echo "Pass:"
read -s Password
echo "Result"
echo "Name $Username , Pass $Password"

