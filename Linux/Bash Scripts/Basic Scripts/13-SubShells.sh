#! /bin/bash

# Script dosyasını alıştırmak için;
#-----------------------------------
# ./13-SubShells.sh 




# SubShells
# Bİr shell altında yeni bir shell oluşturmak için kullanılıyor. 
# BU saede her ne kadar mülti Thread olmasa da multi process işlemler yapılabiliyor.
#

# Kullanımı
#----------------------
#(
#	,,,
#)
#

# Eş zamanlı çaışma için;
#------------------------
#(
#	,,,
#)&
#




echo "************************Usage 1************************"
echo "*********************Definition 1*********************"
# Sub-Shell kullanımına örnek
echo "Bu Parrent Shell'dir (fonksiyonun kendisi)"
(
	echo "Bu Sub-Child Shell'dir"
	for (( m=0;m<11;m++ ))
	do
		echo "index of $m"
		sleep 1	
	done
)
echo "Bu Parrent Shell'dir - son"




echo "************************Usage 2************************"
echo "*********************Definition 1*********************"
#İç içe sub-sShell tanımına örnek
# iç içe oluşturulan Sub-shell'lerin PID değerlerine dikkat etmelisin. Döngünün her iterasyonunda yeni bir Sub-shell açılıyor.
# $BASH_SUBSHELL değişkeni iç içe açılan sub-shell'lerin derecesini göstermek için kullanılıyor.
# $BASHPID değişkeni prosesin/shell'in (sub-shell'in) PID değerinini görüntülemek için kullanılıyor.
echo "---------------------Example 3-------------------"
echo "Bu Parrent Shell'dir (fonksiyonun kendisi)"
echo "Bash_Shell : $BASH_SUBSHELL PID : $BASHPID"
(
	for (( i=0;i<11;i++ ))
	do
		echo "Bu Sub-Child Shell'dir"
		echo "Bash_Shell : $BASH_SUBSHELL PID : $BASHPID"
		(
			echo "Bash_Shell : $BASH_SUBSHELL PID : $BASHPID"	
		)
		sleep 1
	done
)




echo "************************Usage 3************************"
echo "*********************Definition 1*********************"
# Eşzamanlı çalışma yapısına örnek
# Arak Pplana atıldığı için her iki Sub-Shell'de aynı anda saymaya başlayacaktır. (Unblocking Multiprocess Script)
# BU örnekte Parrent proses işini bitirdikten sonra siliniyor. Oluşturduğu Child proses ise yetim (orphan) kalmaması için "systemd" prosesi tarafındann evlatlık ediniliyor (yani Child prosesin Parrent proses id değeri değişiyor - "htop" komutunu çalıştırarak görebilirsin).
#htop komutunda f2 tuşuyla sütun bilgilerinde eklemeler yapman gerekiyor (PPID gibi).
echo "Bu Parrent Shell'dir (fonksiyonun kendisi)"
(
	echo "Bu Sub-Child Shell'dir"

	for (( i=0;i<11;i++ ))
	do
		echo "index of i : $i"
		sleep 1
	done
)&

(
	echo "Bu Sub-Child Shell'dir"
	for (( j=0;j<11;j++ ))
	do
		echo "index of j :  $j"
		sleep 1
	done
)&




#---------------------------------------------------------ÇIKTI---------------------------------------------------------
#************************Usage 1************************
#
#*********************Definition 1*********************
#
#Bu Parrent Shell'dir (fonksiyonun kendisi)
#
#Bu Sub-Child Shell'dir
#
#index of 0
#
#index of 1
#
#index of 2
#
#index of 3
#
#index of 4
#
#index of 5
#
#index of 6
#
#index of 7
#
#index of 8
#
#index of 9
#
#index of 10
#
#Bu Parrent Shell'dir - son
#
#************************Usage 2************************
#
#*********************Definition 1*********************
#
#---------------------Example 3-------------------
#
#Bu Parrent Shell'dir (fonksiyonun kendisi)
#
#Bash_Shell : 0 PID : 3074
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3091
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3093
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3095
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3097
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3099
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3101
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3103
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3105
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3107
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3109
#
#Bu Sub-Child Shell'dir
#
#Bash_Shell : 1 PID : 3090
#
#Bash_Shell : 2 PID : 3111
#
#************************Usage 3************************
#
#*********************Definition 1*********************
#
#Bu Parrent Shell'dir (fonksiyonun kendisi)
#
#Bu Sub-Child Shell'dir
#
#index of i : 0
#
#Bu Sub-Child Shell'dir
#
#index of j :  0
#
#index of i : 1
#
#index of j :  1
#
#index of j :  2
#
#index of i : 2
#
#index of i : 3
#
#index of j :  3
#
#index of i : 4
#
#index of j :  4
#
#index of i : 5
#
#index of j :  5
#
#index of j :  6
#
#index of i : 6
#
#index of j :  7
#
#index of i : 7
#
#index of j :  8
#
#index of i : 8
#
#index of i : 9
#
#index of j :  9
#
#index of i : 10
#
#index of j :  10


