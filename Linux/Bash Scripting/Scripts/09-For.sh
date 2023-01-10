#! /bin/bash

#
#For Kullanımı
#----------------------------------------------------------
# for (( Var=<Start Value>;Var<<Fİnish Value>;<Variable Increment> ))
# do
#	$Var...
# done
#
#
#
# for Var in <COmmand or Numbers>
# do
#	$Var ...
# done
#
#
#
#Bash Script > V3 ise (echo $BASH_VERSİON);
#
# for Var in {<Start>..<Fİnish>..<Increment>}
#do
#	$Var...
#done
#


for (( l=0;l<2;l++ ))
do
	echo "index is $l"
done


for i in ls 1 2 3 4
do
	echo $i
done


for j in pwd ls
do
	echo "**************$j*************"
	$j
done


for k in {1..6..2}
do
	echo "$k for k variable"
done

