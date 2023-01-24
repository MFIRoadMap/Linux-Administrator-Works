#! /bin/bash

# Çıktı komutları silinerek Crontab dosyasında bu dosya için tanımlama yapılabilir. 
#--------------------------------------------------------------------------------------
# Dosya bir kullanıcı (~/) dizini altına eklendikten sonra çalıştırılaacak komutlar;
# sudo su
# echo "* * * * * root /opt/Awk_Sudo_and_Shell_Detect_And_Block.sh" >/etc/crontab


DelProc () {

	tmpLogs=/tmp/auth.tmp
	logSus=/tmp/Sus.Log
	susProc=/tmp/susProc.log

	cat /var/log/auth.log > $tmpLogs

	if  grep -q "awk BEGIN {system(\"/bin/$1\")}" $tmpLogs
	then
		echo "$(ps -aux | grep  "awk BEGIN {system(\"/bin/$1\")}")" > $logSus
		# Script çalıştırıldığında kullanılan awk sorgusunda scriptin çıkarılan pid değerini silmek için tanımlandı
		cat $logSus | sed  '/grep/d' > $susProc

		pid=$(awk '{print $2}' $susProc) 
		sort $(echo "$pid" > $susProc) 2&>1 $susProc
	
		for j in $(cat $susProc)
		do
				kill $j
				echo "Process $j is killed"
		done
	fi
}


touch /tmp/auth.tmp /tmp/Sus.Log /tmp/susProc.log

# Shell'ler eklenebilir
for i in "bash" "sh" "dash"
do
	DelProc $i
done
rm $tmpLogs $logSus $susProc