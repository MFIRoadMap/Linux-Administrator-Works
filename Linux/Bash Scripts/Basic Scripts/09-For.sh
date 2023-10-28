#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./For.sh val1 val2 val3




#
#For Kullanımı
#----------------------------------------------------------
# for (( Var=<Start Value>;Var<<Fİnish Value>;<Variable Increment> ))
# do
#	$Var...
# done
#

# for Var in <COmmand or Numbers>
# do
#	$Var ...
# done
#

#Bash Script > V3 ise (echo $BASH_VERSİON);
#
# for Var in {<Start>..<Fİnish>..<Increment>}
#do
#	$Var...
#done
#

# for Var in $(seq Val)
#do
#	...
#done
#

# for (( Var1, Var2 ; <Finish State> ; Var1++, Var2++ ))
# do
# 	...
# done
#

# for (( Var1 ; <Finish State> ; Var1++))
#{
#	...
#}
#




echo "************************Usage 1************************"
echo "*********************Definition-1*********************"
# C style kullanımına örnek
for (( l=0;l<2;l++ ))
do
	echo "index is $l"
done


echo "*********************Definition-2*********************"
# liste haline verilen tanımlara örnek 
for i in ls 1 2 3 4
do
	echo $i
done


echo "*********************Definition-4*********************"
# Döngüyle sıralı komut çalıştırmaya örnnek
for j in pwd ls
do
	echo "**************Değer*************"
	$j
done


echo "*********************Definition-4*********************"
# süslü parantezli tanıma örnek
for k in {1..6..2}
do
	echo "$k for k variable"
done


echo "*********************Definition-5*********************"
# ardışıl arttırılan tanıma örnek 
for s in $(seq 10) 
do
	echo "satır $s"
done


echo "*********************Definition-6*********************"
# tek for içerisinde iki döngü tanımına örnek
for ((z=1, q=0 ; z<10; z++, q=q+2))
do
	echo "z Var= $z  q Var= $q"
done


echo "*********************Definition-7*********************"
# çift parantezli döngü tanımına örnek
for ((c=0; c<10; c=c+1))
{
	echo "c= $c"
}




echo "************************Usage 2************************"
echo "*********************Definition-1*********************"
# toplu halde çift tırnak içinde verilen liste tanımını döngüye verilişine göre farklı davranışına örnek.
i=0
for arg in "val1 val2 val3 val4"
do
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  $arg
done


echo "******************Definition-2*************************"
# ayrı ayrı çift tırnak içinde verine liste tanımına örnek
i=0
for arg in "val1" "val2" "val3" "val4"
do
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  $arg
done


echo "******************Definition-3*************************"
# toplu halde çift tırnak içinde verilen liste tanımını döngüye verilişine göre farklı davranışına örnek.
list="val1 val2 val3 val4"
i=0
for arg in $list 
do
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  $arg
done




echo "************************Usage-3************************"
echo "******************Definition-1************************"
# Verilen bütün parametrelerin döngüye liste olarak tanımlanmasına örnek
i=0
for k     # for k in $@     ile aynı anlamda  
do
	printf $((i++))
	echo "$i : $k"
done


echo "*********************Definition-2*********************"
# Dosya içinde aranan kelimelerin bulunduğu satırların konsola yazılması
for w in $(cat "text.txt" | grep "$1")
do 
	echo "$w"
done



echo "************************Usage-4************************"
echo "*********************Definition-1*********************"
# Dizindeki bürün .txt uzantılı dosyaların son satırına ekleme yapılmasına örnek
for f in /home/vm-user/Desktop/*.txt 
do 
	echo "Hello man" >> $f
done


echo "*********************Definition-2*********************"
# Döngüye verilen çok boyutlu listelerin içeriğinin parse edilmesine örnek
i=0
for arg in "val1 1" "val2 1" "val3 3" "val4 4"
do
	set -- $arg
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  "$1 değeri= $2"
done




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition-1*********************
#
#index is 0
#
#index is 1
#
#*********************Definition-2*********************
#
#ls
#
#1
#
#2
#
#3
#
#4
#
#*********************Definition-4*********************
#
#**************Değer*************
#
#/home/vm-user/Desktop
#
#**************Değer*************
#
#Ex.sh  text.txt  text.txt.gz
#
#*********************Definition-4*********************
#
#1 for k variable
#
#3 for k variable
#
#5 for k variable
#
#*********************Definition-5*********************
#
#satır 1
#
#satır 2
#
#satır 3
#
#satır 4
#
#satır 5
#
#satır 6
#
#satır 7
#
#satır 8
#
#satır 9
#
#satır 10
#
#*********************Definition-6*********************
#
#z Var= 1  q Var= 0
#
#z Var= 2  q Var= 2
#
#z Var= 3  q Var= 4
#
#z Var= 4  q Var= 6
#
#z Var= 5  q Var= 8
#
#z Var= 6  q Var= 10
#
#z Var= 7  q Var= 12
#
#z Var= 8  q Var= 14
#
#z Var= 9  q Var= 16
#
#*********************Definition-7*********************
#
#c= 0
#
#c= 1
#
#c= 2
#
#c= 3
#
#c= 4
#
#c= 5
#
#c= 6
#
#c= 7
#
#c= 8
#
#c= 9
#
#************************Usage 2************************
#
#*********************Definition-1*********************
#
#0:val1 val2 val3 val4
#
#******************Definition-2*************************
#
#0:val1
#
#1:val2
#
#2:val3
#
#3:val4
#
#******************Definition-3*************************
#
#0:val1
#
#1:val2
#
#2:val3
#
#3:val4
#
#************************Usage-3************************
#
#******************Definition-1************************
#
#01 : val1
#
#12 : val2
#
#23 : val3
#
#*********************Definition-2*********************
#
#************************Usage-4************************
#
#*********************Definition-1*********************
#
#*********************Definition-2*********************
#
#0:val1 değeri= 1
#
#1:val2 değeri= 1
#
#2:val3 değeri= 3
#
#3:val4 değeri= 4
#
#
#