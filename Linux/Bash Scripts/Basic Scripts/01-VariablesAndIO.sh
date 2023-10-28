#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./01-VariablesAndIO.sh 
# Name
# Name1 Name2 Name3
# unname
# names
#
#


echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Environment Variables, Sistem üzerinde tanımlı-kullanılan değişkenlerdir.
# Sistem açılırken set edilirler
echo "Kullanılan Bash versiyonu:  $BASH_VERSION"
echo "Oturum açuılan kullanıcı: $USER"
echo "Home dizini yolu: $HOME"
echo "Bulunduğun dizin: $PWD"


echo "*********************Definition 2*********************"
# User variables, kullacıların tanımladığı değişkenlerdir (aada boşluk olmamalı).
text1="Bash oğreniyorum"
echo "$text1"




# CLI üzerinden giriş alma şekilleri
echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
# Doğrudan read komutuyla anılabiliyor
echo "Input Name"
read name 
echo "Name $name"


echo "*********************Definition 2*********************"
# Tek seferde birden fazla giriş alabilmeye örnek
# girilen değerler aralarında boşluklara göre değişkenlere atanıyor
echo "Input Names"
read name1 name2 name3
echo "$name1 , $name2, $name3"


echo "*********************Definition 3*********************"
# Girişi aynı satırda almaaya örnek
read -p 'Input Name: ' name
echo "$name"


echo "*********************Definition 4*********************"
# Son girişi $REPLY komutuyla almaya örnek
echo "Input Name"
read
echo "Name is: $REPLY"



#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#Kullanılan Bash versiyonu:  5.1.16(1)-release
#
#Oturum açuılan kullanıcı: vm-user
#
#Home dizini yolu: /home/vm-user
#
#Bulunduğun dizin: /home/vm-user/Desktop
#
#*********************Definition 2*********************
#
#Bash oğreniyorum
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#Input Name
#
#Name
#
#Name Name
#
#*********************Definition 2*********************
#
#Input Names
#
#Name1 Name2 Name3
#
#Name1 , Name2, Name3
#
#*********************Definition 3*********************
#
#Input Name: unname
#
#unname
#
#*********************Definition 4*********************
#
#Input Name
#
#Names      