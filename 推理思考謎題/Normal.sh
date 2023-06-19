
n=3
while true; do
        dialog --title "普通" --inputbox "誠實村與騙人村在圓桌圍成一圈開會，主席問了三個問題：

	1.「如果你『右手邊那個人，是誠實村的人』的話，請舉手」有4個人舉手
	2.「如果你『左手邊那個人，上一個問題有舉手』的話，請舉手」一樣有4個人舉手
	3.「如果你『前兩次都有舉手』的話，麻煩請再舉一次手」這次只有2個人舉手

	誠實村及騙人村參加會議的人數相等，並且主席自己舉了兩次手
	請問參加會議的總人數為何？" 17 75 2> selection.txt

        result=$(cat selection.txt)

	        if [[ $result == *"8"* ]]; then
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

