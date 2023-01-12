#! /bin/bash

#Script dosyasını çalıştırmak için
#-------------------------------------------
# ./For.sh val1 val2 val3

#
#For Kullanımı
#----------------------------------------------------------
# for (( Var=<Start Value>;Var<<Fİnish Value>;<Variable Increment> ))
# do
#	$Var...
# done
#

#
# for Var in <COmmand or Numbers>
# do
#	$Var ...
# done
#

#
#Bash Script > V3 ise (echo $BASH_VERSİON);
#
# for Var in {<Start>..<Fİnish>..<Increment>}
#do
#	$Var...
#done
#

#
# for Var in $(seq Val)
#do
#	...
#done
#

#
# for (( Var1, Var2 ; <Finish State> ; Var1++, Var2++ ))
# do
# 	...
# done
#

#
# for (( Var1 ; <Finish State> ; Var1++))
#{
#	...
#}
#


echo "******************Kullanım-0************************"
echo "******************Tanım-1************************"
for (( l=0;l<2;l++ ))
do
	echo "index is $l"
done


echo "******************Tanım-2************************"
for i in ls 1 2 3 4
do
	echo $i
done


echo "******************Tanım-4************************"
for j in pwd ls
do
	echo "**************Değer*************"
	$j
done


echo "******************Tanım-4************************"
for k in {1..6..2}
do
	echo "$k for k variable"
done


echo "******************Tanım-5************************"
for s in $(seq 10) 
do
	echo "satır $s"
done


echo "******************Tanım-6************************"
for ((z=1, q=0 ; z<10; z++, q=q+2))
do
	echo "z Var= $z  q Var= $q"
done


echo "******************Tanım-7************************"
for ((c=0; c<10; c=c+1))
{
	echo "c= $c"
}




echo "******************Kullanım-1************************"
echo "******************Tanım-1************************"
i=0
for arg in "val1 val2 val3 val4"
do
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  $arg
done


echo "******************Tanım-2*************************"
i=0
for arg in "val1" "val2" "val3" "val4"
do
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  $arg
done


echo "******************Tanım-3*************************"
list="val1 val2 val3 val4"
i=0
for arg in $list 
do
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  $arg
done




echo "******************Kullanım-2************************"
echo "******************Tanım-1************************"
# ./Ex-3.sh val1 val2 val3
i=0
for k     # for k in $@     ile aynı anlamda  
do
	printf $((i++))
	echo "$i : $k"
done


echo "******************Tanım-2************************"
for w in $(cat "text.txt" | grep "$1")
do 
	echo "$w"
done



echo "******************Kullanım-3************************"
echo "******************Tanım-1************************"
for f in /home/vm-user/Desktop/BashScriptApp/Exercises/*.txt 
do 
	echo "Hello man" >> $f
done


echo "******************Tanım-2************************"
i=0
for arg in "val1 1" "val2 1" "val3 3" "val4 4"
do
	set -- $arg
	#printf "$((i++)): $arg \n"
	printf "$((i++)):"
	echo  "$1 değeri= $2"
done


















