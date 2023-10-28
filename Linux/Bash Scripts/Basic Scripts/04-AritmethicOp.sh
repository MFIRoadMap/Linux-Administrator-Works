#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./04-AritmethicOp.sh 
# 4 5
#
#




#Aritmetik işlemler
#-------------------------------------------
# +  ->  Toplama
# -  ->  Çıkarma 
# *  ->  Çarpma
# /  ->  Bölme
# %  ->  Mod
# ^  -> Üstel ifade
#

# +=  
# -=
# *=
# /=
# %=
#

#Integer aritmetik işlem 
# (( a+b ))  ->  Boşluk bırakmak şart değil
# $( expr $a + $b  -> Boşluk bırakmak şart
# |--> Çarpma işleminde hata almamak için çarpma sembolünden önce escape sembolu koyulması gerekiyor
#

#Floating aritmetik işlemler 
# " $a+$b " | bc 
#




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Aritmetik işlemlerin tanımına örnek
echo 1+1
echo $(( 1+1 ))




echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
Sayi3=0
echo "İki sayı giriniz"
read Sayi1 Sayi2

echo "*********************Definition 2*********************"
# Aritmetik işlemlerde çit normal parantezli kullanıma örnek
echo "Toplam: $(( Sayi1+Sayi2 ))"
echo "Fark: $(( Sayi1-Sayi2 ))"
echo "Çarpım: $(( Sayi1*Sayi2 ))"
echo "Bölüm: $(( Sayi1/Sayi2 ))"
echo "Kalan: $(( Sayi1%Sayi2 ))"


echo "*********************Definition 2*********************"
# expr komuttuyla aritmerik işlemlerin yapılmasına örnek
echo "Toplam: $(expr $Sayi1 + $Sayi2 )"
echo "Fark: $(expr $Sayi1 - $Sayi2 )"
echo "Çarpım: $(expr $Sayi1 \* $Sayi2 )"
echo "Bölüm: $(expr $Sayi1 / $Sayi2 )"
echo "Kalan: $(expr $Sayi1 % $Sayi2 )"


echo "*********************Definition 3*********************"
# Doğrudan aritmetik işlem tanımına örnek
(( Sayi1+=Sayi1 ))
echo "Sayi1*2= $Sayi1 "




echo "************************Usage 3************************"
echo "*********************Definition 1*********************"
echo  "12.4+5"


echo "*********************Definition 2*********************"
# Küsüratlı işlem tanımlarına örnekler
echo  "12.4+5" | bc
echo  "12.4-5" | bc
echo  "12.4*5" | bc
echo  "scale=10; 12.4/5" | bc     #"scale" komutuyla virgülden sonra görüntülenmek istenen basamak sayısı belirtiliyor
echo  "12.4%5" | bc
echo  "scale=10; 11.4^3" | bc 


echo "*********************Definition 3*********************"
# Math kütüphanesi kullanımına örnek
echo  "scale=10; sqrt(12.5)" | bc -i     # -i parametresiyle Math kütüphanesii kullandığımızı belirtiyoruz. "scale" komutuyla virgülden sonra görüntülenmek istenen basamak sayısı belirtiliyor




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#1+1
#
#2
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#İki sayı giriniz
#
#4 5
#
#*********************Definition 2*********************
#
#Toplam: 9
#
#Fark: -1
#
#Çarpım: 20
#
#Bölüm: 0
#
#Kalan: 4
#
#*********************Definition 2*********************
#
#Toplam: 9
#
#Fark: -1
#
#Çarpım: 20
#
#Bölüm: 0
#
#Kalan: 4
#
#*********************Definition 3*********************
#
#Sayi1*2= 8 
#
#************************Usage 3************************
#
#*********************Definition 1*********************
#
#12.4+5
#
#*********************Definition 2*********************
#
#17.4
#
#7.4
#
#62.0
#
#2.4800000000
#
#2.4
#
#1481.544
#
#*********************Definition 3*********************
#
#bc 1.07.1
#
#Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc.
#
#This is free software with ABSOLUTELY NO WARRANTY.
#
#For details type `warranty'. 
#
#scale=10; sqrt(12.5)
#
#3.5355339059

