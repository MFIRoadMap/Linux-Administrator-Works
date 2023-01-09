#! /bin/bash


#Environment Variables, Sistem üzerinde tanımlı-kullanılan değişkenlerdir.
echo "Kullanılan Bash versiyonu:  $BASH_VERSION"
echo "Oturum açuılan kullanıcı: $USER"
echo "Home dizini yolu: $HOME"
echo "Bulunduğun dizin: $PWD"


#User variables, kullacıların tanımladığı değişkenlerdir (aada boşluk olmamalı).
text1="Bash oğreniyorum"
echo "$text1"


#CLI üzerinden giriş alma şekilleri

#./Variables.sh
#Name1
#--------------------------------
echo "Input Name"
read name 
echo "Name $name"


#./Variables.sh
# Name1 Name2 Name3
#-------------------------------
echo "Input Names"
read name1 name2 name3
echo "$name1 , $name2, $name3"


#./Variables.sh
#Name1
#-------------------------------
read -p 'Input Name: ' name
echo "$name"


#./Variables.sh
#Name1
#-------------------------------
echo "Input Name"
read
echo "Name is: $REPLY"

