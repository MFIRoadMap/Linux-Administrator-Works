#! /bin/bash


# Çıktı komutları silinerek Crontab dosyasında bu dosya için tanımlama yapılabilir. 
# Dosya bir kullanıcı (~/) dizini altına eklendikten sonra çalıştırılaacak komutlar;
# sudo su
# sudo echo "* * * * * <USERNAME> ~/Awk_Sudo_Detect_And_Block.sh" >/etc/crontab
# Dikkat edilmesi gereken nokta, Awk_Sudo_Detect_And_Block.sh dosyası <USERNAME> kullanıcısının HOME dizini altında aranacaktır. 


killProc () {
((tmpPID1=$2+6))
((tmpPID2=$2+5))
for j in $(cat $1)
do
	if [[ $j != $tmpPID1 && $j != $tmpPID2 ]]
	then
		kill $j
		echo "$j proccess is kill"
	else
		echo "suspicious log is not found"
	fi
done
}

#her komut 2 child proses oluşturuyor
tmpLogs=~/auth.tmp
logSus=~/Sus.Log
cat /var/log/auth.log > $tmpLogs
if  grep -q "awk BEGIN {system(\"/bin/sh\")}" $tmpLogs
then
	echo "$(ps -aux | grep  "sudo awk BEGIN {system(\"/bin/sh\")}")" > $logSus
	pid=$(awk '{print $2}' $logSus) 
	sort $(echo "$pid" > $logSus) 2&>1 $logSus
	killProc $logSus $$
fi
