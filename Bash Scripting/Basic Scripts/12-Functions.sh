#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./12-Functions.sh Par1 Par2




#Fonksiyonlar
#-----------------------------------
#
# function <Fun Name>(){
#	...
#}
#
# <Fun Name>
#
#
#<Fun Name>(){
#	...
#}
#





echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
yaz(){
	echo "ilk parametre: $1"
	echo "ikinci parametre: $2"
}
yaz Par1 Par2    #yaz fonksiyonuna parametre olarak veriliyor


echo "*********************Definition 2*********************"
function FirstFun(){
	
	gnome-terminal &
}
FirstFun




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Scope konusuna örnek 
# Fonksiyon içinde tanımlanan değişkenler fonksiyon dışında kullanılamıyor
PrintVal (){     
	name="Name1"
}
PrintVal
echo "Priv call func: $name "
name="Name2"
echo "Than call fun $name "




echo "*********************Definition 2*********************"
# Local komutunun kullanımına örnek
#fonksiyon içinde aynı isimde değişkene yapılan atama işlemi globaldeki değişkeni de etkiliyor. "local" kelimesi kullanılarak bu karmaşıklığın düzeltilmesi sağlanabiliyor 
echo "***Scope2-Not-Use-local***"
function ScopeVal(){     
	
	val1="Name1"
	echo "Value: $val1"
}
val1="Name2"
echo "Value: $val1"
ScopeVal
echo "Value: $val1"

echo "***Scope2-Use-local***"
function ScopeVal(){     
	
	local val1="Name1"
	echo "Value: $val1"
}
val1="Name2"
echo "Value: $val1"
ScopeVal
echo "Value: $val1"


echo "*********************Definition 3*********************"
#fonksiyon içinde "local" kelimesi kullanılmadan tanımlanan değişkenler fonksiyon dışından da erişşlebiliyor.
fonfon (){
	local deg1="!!11111!!"
	deg2="!!22222!!"
	echo "fonksiyon içerisinde değer 1 : $deg1 değer 2 : $deg2"
}
fonfon
echo "fonksiyon dışı için değer 1 : $deg1 değer 2 : $deg2"






echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
#Aynı isimde tanımlanan fonksiyonların çalışma mantığına örnek
#aynı isimde birden fazla foknsiyon bulunursa her zaman son tanımlı fonksiyon çalıştırılır
fun () {
echo "ilk fun çalıştırıldı"
}
fun () {
echo "ikinci fun çalıştırıldı"
}
fun () {
echo "üçüncü fun çalıştırıldı"
}
fun () {
echo "dördüncü fun çalıştırıldı"
}
fun


echo "*********************Definition 2*********************"
# İç içe fonksiyon tanımına örnek
Defin (){
	echo "DEf1"
	SubDefin (){
		echo "Def2"
	}
	SubDefin
}
Defin




echo "************************Usage 3************************"
echo "*********************Definition 1*********************"
# Return kullanımına örnek 
funret (){
	retval=11
	#sadece integer değer girilebiliyor ve 0-255 arası değer verilebiliyor
	return $retval
}
funret
echo "value of retval : $?"


echo "*********************Definition 2*********************"
# Shift kullanımına örnek
mul (){
	local prod=1
	until [ -z "$1" ]
	do
		let "prod *= $1"
		shift
	done
echo $prod
}
say1=5; say2=4;
#ters tek tırnak içerisinde komutlar algılanıyor
val=`mul $say1  $say2`
echo "$val"




echo "************************Usage 4************************"
echo "*********************Definition 1*********************"
# Fonksiyonların eş zamanlı çalışmasına örnek
#fonksiyonların da paralel çalışması sağlanabiliyor - htop üzerinde bakıldığında 3 proses görünecektir. 
hes1 (){
	for (( o=0;o<11;o+=2 ))
	do
	echo "count is $o hes1"
	sleep 1
	done
}

hes2 (){
	for (( p=0;p<11;p+=4 ))
	do
	echo "count is $p hes2"
	sleep 2
	done
}
hes1 &
hes2 &
sleep 10




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#ilk parametre: Par1
#
#ikinci parametre: Par2
#
#*********************Definition 2*********************
#
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#Priv call func: Name1 
#
#Than call fun Name2 
#
#*********************Definition 2*********************
#
#***Scope2-Not-Use-local***
#
#Value: Name2
#
#Value: Name1
#
#Value: Name1
#
#***Scope2-Use-local***
#
#Value: Name2
#
#Value: Name1
#
#Value: Name2
#
#*********************Definition 3*********************
#
#fonksiyon içerisinde değer 1 : !!11111!! değer 2 : !!22222!!
#
#fonksiyon dışı için değer 1 :  değer 2 : !!22222!!
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#dördüncü fun çalıştırıldı
#
#*********************Definition 2*********************
#
#DEf1
#
#Def2
#
#************************Usage 3************************
#
#*********************Definition 1*********************
#
#value of retval : 11
#
#*********************Definition 2*********************
#
#20
#
#************************Usage 4************************
#
#*********************Definition 1*********************
#
#count is 0 hes1
#
#count is 0 hes2
#
#count is 2 hes1
#
#count is 4 hes2
#
#count is 4 hes1
#
#count is 6 hes1
#
#count is 8 hes2
#
#count is 8 hes1
#
#count is 10 hes1

