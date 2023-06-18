n=2
while true; do
	dialog --title "簡單" --checklist "有甲、乙、丙、丁、戊五個人，每個人頭上戴一頂白帽子或者黑帽子，每個人只能看見別人頭上帽子的顏色，看不見自己頭上帽子的顏色。戴白帽子的人只能說真話，戴黑帽子只能說謊話。
	甲說：我看見三頂白帽子一頂黑帽子。乙說：我看見四頂黑帽子。
	丁說：我看見一頂白帽子三頂黑帽子。戊說：我看見四頂白帽子。
	請問誰戴了白帽子？（可複選）" 17 75 5 \
		1 "甲" off \
		2 "乙" off \
		3 "丙" off \
		4 "丁" off \
		5 "戊" off 2> selection.txt

	result=$(cat selection.txt)

	if [[ $result == *"3"* && $result == *"4"* ]]; then
		dialog  --msgbox "恭喜答對！" 10 50
		break
	elif  [[ $n == 0 ]]; then
                dialog  --msgbox "請好好睡一覺後再回來挑戰吧。" 10 50
		break
	else
		dialog  --yesno "好可惜！您還有$n次機會，請問要繼續嘗試嗎？" 10 50
	    	response=$?
		n=$((n-1))
		if [[ $response -ne 0 ]]; then
			dialog --title "" --msgbox "請好好睡一覺後再回來挑戰吧。" 10 50
			break
		fi
	fi
done
