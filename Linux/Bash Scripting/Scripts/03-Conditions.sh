#! /bin/bash


#Sayı karşılaştırmaları
#------------------------------------
#Tek köşeli parantezle kullanılanlar
# -eq  ->  eşit eşitse     / if[ $a -eq $b ]
# -ne  ->  eşit değilse    / if[ $a -ne $b ]
# -gt  ->  büyükse         / if[ $a -gt $b ]
# -ge  ->  büyük eşitse    / if[ $a -ge $b ]
# -lt  ->  küçükse         / if[ $a -lt $b ]
# -le  *>  küçük eşitse    / if[ $a -le $b ]


#Çift köşeli paramtezle kullanılanlar
# ==  ->  eşit eşitse      / if(( $a == $b ))
# >   ->  büyükse          / if(( $a > $b ))
# >=  ->  büyük eşitse     / if(( $a <= $b ))
# <   ->  Küçükse          / if(( $a < $b ))
# <=  ->  Küçük eşitse     / if(( $a <= $b ))


#Metin karşılaştırmaları
#------------------------------------
# =   ->  eşitse           / if[ $a = $b ]
# ==  ->  eşitse           / if[ $a == $b ]
# !=  ->  eşit değilse     / if[ $a != $b ]
# >   ->  büyükse (ASCII)  / if[[ $a > $b ]]
# <   ->  küçükse (ASCII)  / if[[ $a < $b ]]


# AND , OR
#-------------------------------------
#Çift köşeli paramtezle kullanılanlar
# &&  -> AND                / if [[ $a && $b ]]   /[[ $a && $b ]]
# -a  -> AND                / if [[ $a -a $b ]]   /[[ $a -a $b ]]
#Tek köşeli parantezle kullanılanlar
# ||  -> OR                 / if [ $a || $b ]   /[ $a || $b ]
# -o  -> OR                 / if [ $a -o $b ]   /[ $a -o $b ]


#if - else kullanımı
#-------------------------------------
# if [[ Express1  Condition Express2 ... ]] 
# then
# ...
# fi

# if [[ Express1  Condition Express2 ... ]] 
# then
# ...
# elif [[ Express1  Condition Express2 ... ]] 
# then
# ...
# fi

# if [[ Express1  Condition Express2 ... ]] 
# then
# 	...
# elif [[ Express1  Condition Express2 ... ]] 
# then
# 	...
# else
# 	...
# fi


#if  - elif - else kullanımı (koşul yapısında boşluk kullanımı önemli)
a=1
b=1
c=2
d=Ali
e=Ayse


if [[ $d < "ceren" ]]
then
	echo "çift köşeli parantez"
fi


if [ $a -eq  $b ]
then
	echo "tek köşeli parantez"
fi


if (( $c >  1 ))
then
	echo "cift normal parantez - c > 1 "
	elif (( $c < 1 ))
	then
		echo "cift normal parantez - c < 1"
	else
		echo "cift normal parantez - c = 1"
fi


# .Conditions.sh <Number>
if (( $1 < "10" )) && [ $1 -ge 0 ]
then
	echo "Gİriş yapılan değer < 10"
	elif (( $1 > 10 )) && [ $1 -le 100 ]
	then
		echo "100 > Gİriş yapılan değer > 10"
	elif (( $1 == 0 ))
	then
		echo "Gİriş yapılan değer = 10 "
	else
		echo "Gİriş yapılan değer 0 ila 100 aralığının dışında bir deperdir "
fi



