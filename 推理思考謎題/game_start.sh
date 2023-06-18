
dialog  --stdout --title "選擇難易度" --radiolist "單選" 10 30 3 1 "簡單" on  2 "普通" off  3 "困難" off  > 難度.txt
snh=$(cat 難度.txt)
case $snh in
	1)
		./Simple.sh
	;;
	2)
		./Normal.sh
	;;
	3)
		./Hard.sh
	;;
	*)
		echo "Error"
		2> error.txt
	;;
esac
