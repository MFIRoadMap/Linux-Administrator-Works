#! /bin/bash

#
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


echo "------------------------Usage-1------------------------"
yaz(){
	echo "ilk parametre: $1"
	echo "ikinci parametre: $2"
}
yaz Par1 Par2    #yaz fonksiyonuna parametre olarak veriliyor




echo "------------------------Usage-2------------------------"
function FirstFun(){
	
	gnome-terminal &
}
FirstFun




echo "------------------------Scope1------------------------"
#fonksiyon içinde tanımlanan değişkenler fonksiyon dışında kullanılamıyor
PrintVal (){     
	name="Name1"
}
PrintVal
echo "Priv call func: $name "
name="Name2"
echo "Than call fun $name "




echo "------------------------Scope2------------------------"
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



