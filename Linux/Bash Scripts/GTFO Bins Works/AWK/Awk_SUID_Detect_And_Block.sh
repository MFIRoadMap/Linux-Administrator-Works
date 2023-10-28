#! /bin/bash


path="/home/files.tmp"
if [[ ! -f  "$path" ]] 
then
	touch $path
fi


echo "$(find /home/ -type f \( -perm -4000 -o -perm -2000 \) -exec ls -l {} \;)" > $path
echo "$(awk '{print $9}' $path)" > $path


if [[ ! -s "$path" ]]
then
	echo "Fİle is not found"
else
	cat $path | while read line
	do
		chmod 0444 $line
		echo "Fİle Permission is change $line"		
	done	
fi

rm $path





