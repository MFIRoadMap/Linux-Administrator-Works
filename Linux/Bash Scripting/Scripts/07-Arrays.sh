#! /bin/bash

#Dizi Kullanımı
#-----------------------------
#
#Tanım
# Array=( 'Val1' 'Val2' 'Val3' )     
#
#
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
#
#

arr=('val1' 'val2'  'val3')
echo "${arr[2]} "
echo "${arr[@]} "
echo "${!arr[@]} "
echo "${#arr[@]} "


arr+=("val4" "val5" "val6")


arr="${arr[@]:1:5}"
echo $arr


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


