#! /bin/bash


#
#Select Kullanımı
#-----------------------------------
#
# select Variable in Val1 Val2 Val3
# do
# 	...
# done
#
#
#
# select Variable in Val1 Val2 Val3
# do
# 	case Variable in
#	Val1 )
#		...;;
#	Val2 )
#		...;;
#	Val3 
#		...;;
#	* )
#		...;;
#	esac
# done
#
#
#
#


# ./10-Select.sh 
# 2
# 6
# 1
select cities in Mersin Antalya Hatay Malatya
do
	case $cities in
	Mersin )
		echo "Mersin ili seçildi";;
	Antalya )
		echo "Antalya ili seçildi";;
	Hatay )
		echo "Hatay ili seçildi";;
	Malatya )
		echo "Malatya ili seçildi";;
	* )
		echo "LÜtfen geçerli bir sayısal ifade giriniz";;
	esac
done

