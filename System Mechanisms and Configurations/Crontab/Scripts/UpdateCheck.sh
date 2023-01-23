#! /bin/bash

# chmod 711 UpdateCheck.sh
# ./UpdateCheck.sh List

file=~/Desktop/Upgredable.txt
echo "----------Date: $DATE ----------"
apt list --upgradable | sed 's/\// /' | awk '{print $1}' > $file
sed -i 1d $file 


if [[ $1 == "List" ]] 
then
	i=0
	cat $file | while read line 
	do
		echo "Line $i : $line"
		(( i++ ))
	done
fi

