#! /bin/bash


# Çıktı komutları silinerek Crontab dosyasında bu dosya için tanımlama yapılabilir. 
# Dosya bir kullanıcı (~/) dizini altına eklendikten sonra çalıştırılaacak komutlar;
# sudo su
# sudo echo "* * * * * <USERNAME> ~/Awk_Sudo_Detect_And_Block.sh" >/etc/crontab
# Dikkat edilmesi gereken nokta, Awk_Sudo_Detect_And_Block.sh dosyası <USERNAME> kullanıcısının HOME dizini altında aranacaktır. 

DelProc () {
	tmpLogs=~/auth.tmp
	logSus=~/Sus.Log
	susProc=~/susProc.log

	cat /var/log/auth.log > $tmpLogs

	if  grep -q "awk BEGIN {system(\"/bin/$1\")}" $tmpLogs
	then
		echo "$(ps -aux | grep  "sudo awk BEGIN {system(\"/bin/$1\")}")" > $logSus
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
	rm $tmpLogs $logSus $susProc
}


# Shell'ler eklenebilir
for i in "bash" "sh" "dash"
do
	DelProc $i
done