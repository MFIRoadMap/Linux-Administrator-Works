#! /bin/bash
#***********HENÜZ TAMAMLANMADI*************



BHoFName="Backup_Hash_of_Fİles.txt"
HoFName="Hash_of_Files.txt"

function  getHash(){
	echo "$(find . -type f  \( -exec sha1sum "$PWD"/{}  \;  \) )" > $HoFName
}

function getCompare(){

	BHoFFSize="$(grep -c ^  $BHoFName)"
	HoFFSize="$(grep -c ^ $HoFName)"
	echo "$HoFFSize"
	echo "$BHoFFSize"
	GSize=$BHoFFSize
	
	
	if (( $BHoFFSize <  $HoFFSize && $BHoFFSize != $HoFFSize ))
	then
		GSize=$BHoFFSize
	fi

	w=0
	while read line;
	do
		if  
		then
			echo "Dosyabulundu"
		else
			echo "Dosyabulunamadı"
		fi

		((w=w+1))
	done < $HoFName | awk '{print $1}'


}



if [[ ! -e $BHoFName ]]
then
	touch $BHoFName
fi

if [[ ! -e $HoFName ]] 
then
	touch $HoFName
fi

#kodu tamamladığımda kullanıcıya backup dosyasının güncellenmesini istiyor mu idye sorarak güncelleriz. 
cat $HoFName > $BHoFName

getHash
getCompare




