#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./07-Arrays.sh 




#Dizi Kullanımı
#-----------------------------
#
#Tanım
# Array=( 'Val1' 'Val2' 'Val3' )     
#

#Kullanım
# Array[<Index>]='val4'     #Yeni eleman ekleme
# Array=('val1' 'val2' 'val3')     #çoklu ekleme
# unser Arr[<INdex<]      #Eleman çıkarma işlemi
# Array[<Index1>,<Index2>]=Value1     #Çok boyutlu dizi tanımları yapılabiliyor.
#

# ${Array[3]}     #Indeksli dizi elemanını gösterir
# ${Array[@]}     #TÜm dizi elemanlarını görüntüler
# ${!Array[@]}    #Dİzideki tüm elemanları indekslerini gösterir gösterir
# ${#arr[@]}      #Dizi boyutunu gösterir
# ${arr[@]:1:5}"     #Aralığı seçmek için kullanılıyor
#




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Dizi tanımı ve özelliklerini görüntülemeye örnek
arr=('val1' 'val2'  'val3')
echo "${arr[2]} "
echo "${arr[@]} "
echo "${!arr[@]} "
echo "${#arr[@]} "


echo "*********************Definition 2*********************"
# Dizide toplu atama ve aralık seçem işlemlerine örnek
arr+=("val4" "val5" "val6")
arr="${arr[@]:1:5}"
echo $arr




echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
# Çok boyutlu dizi kullanımı - Matris yapısı örneği
arrMat[1,1]="val1_1"
arrMat[1,2]="val1_2"
arrMat[2,1]="val2_1"
arrMat[2,2]="val2_2"
for ((j=1;j<=2;j++)) do
    printf "$f1" $j
    for ((i=1;i<=2;i++)) do
        printf ${arrMat[$i,$j]}
    done
    echo
done





echo "************************Usage 3************************"
echo "*********************Definition 1*********************"
# Dizi üzeride atama ve aritmatik işlemlere örnek 
newarr=(1 2 val3)
#roplo atama yapmaya örnek
newarr+=([3]=val4 [4]=val5 [5]=val6)
# dizi elemanları arasında aritmetik işlemler yapılabiliyor (ters tırnak kullanılyor)
newarr[6]=`expr ${newarr[0]} + ${newarr[1]}`
# string toplama yapılmıyor
newarr[7]=`expr ${newarr[3]} + ${newarr[4]}`


echo "*********************Definition 2*********************"
# Döngü kullanaraj dizi görüntüleme
for (( k=0;k<11;k++ ))
do
	echo "${newarr[$k]}"
done


echo "*********************Definition 3*********************"
# TEKRAR
# dizi elemanının boyutunu gösterir
echo "size of array : ${#newarr[2]}"
# dizi boyutunu görümtüleme
echo "size of array : ${#newarr[*]}"
# Dİzi elemanlarını yazdırma
echo "items of array : ${newarr[@]}"
#dzinin içerisinden belirli elemanl aralığını seçmek için kullanılıyor
echo "range of array : ${newarr[@]:3:4}"
#parametre expension - dizi itemlerinin belirli kıısımlarından ihtibaren seçilmesi sağlanıyor
# aynı şekilde stringlere de uygulanabiliyor
# str="helowprld"; echo "${str:3:5}";  
echo "array : ${newarr[3]:1}"
echo "array : ${newarr[3]:1:2}"




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#val3 
#
#val1 val2 val3 
#
#0 1 2 
#
#3 
#
#*********************Definition 2*********************
#
#val2 val3 val4 val5 val6
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#val2_1val2_1
#
#val2_2val2_2
#
#************************Usage 3************************
#
#*********************Definition 1*********************
#
#expr: non-integer argument
#
#*********************Definition 2*********************
#
#1
#
#2
#
#val3
#
#val4
#
#val5
#
#val6
#
#3
#
#
#
#
#
#
#
#
#
#*********************Definition 3*********************
#
#size of array : 4
#
#size of array : 8
#
#items of array : 1 2 val3 val4 val5 val6 3 
#
#range of array : val4 val5 val6 3
#
#array : al4
#
#array : al
#
