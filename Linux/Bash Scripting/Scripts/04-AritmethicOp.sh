#! /bin/bash


#Aritmetik işlemler
#-------------------------------------------
# +  ->  Toplama
# -  ->  Çıkarma 
# *  ->  Çarpma
# /  ->  Bölme
# %  ->  Mod
# ^  -> Üstel ifade
#
# +=  -> 
# -=
# *=
# /=
# %=

#Integer aritmetik işlem 
# (( a+b ))  ->  Boşluk bırakmak şart değil
# $( expr $a + $b  -> Boşluk bırakmak şart
# |--> Çarpma işleminde hata almamak için çarpma sembolünden önce escape sembolu koyulması gerekiyor


#Floating aritmetik işlemler 
# " $a+$b " | bc 


echo 1+1
echo $(( 1+1 ))


Sayi3=0
echo "İki sayı giriniz"
read Sayi1 Sayi2

echo "***********Çift Parantezli Sonuçlar***********"
echo "Toplam: $(( Sayi1+Sayi2 ))"
echo "Fark: $(( Sayi1-Sayi2 ))"
echo "Çarpım: $(( Sayi1*Sayi2 ))"
echo "Bölüm: $(( Sayi1/Sayi2 ))"
echo "Kalan: $(( Sayi1%Sayi2 ))"


echo "************Expr İfadeli Sonuçlar*************"
echo "Toplam: $(expr $Sayi1 + $Sayi2 )"
echo "Fark: $(expr $Sayi1 - $Sayi2 )"
echo "Çarpım: $(expr $Sayi1 \* $Sayi2 )"
echo "Bölüm: $(expr $Sayi1 / $Sayi2 )"
echo "Kalan: $(expr $Sayi1 % $Sayi2 )"

(( Sayi1+=Sayi1 ))
echo "Sayi1*2= $Sayi1 "


echo  "12.4+5"

echo  "*************Küsüratlı Sayılarla İşlemler*************"
echo  "12.4+5" | bc
echo  "12.4-5" | bc
echo  "12.4*5" | bc
echo  "scale=10; 12.4/5" | bc     #"scale" komutuyla virgülden sonra görüntülenmek istenen basamak sayısı belirtiliyor
echo  "12.4%5" | bc
echo  "scale=10; 11.4^3" | bc 

echo  "scale=10; sqrt(12.5)" | bc -i     # -i parametresiyle Math kütüphanesii kullandığımızı belirtiyoruz. "scale" komutuyla virgülden sonra görüntülenmek istenen basamak sayısı belirtiliyor


