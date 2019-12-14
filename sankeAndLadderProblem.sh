#!/bin/bash -x
echo "Welcome to sanke and lader game"

START_POSITION=0
NO_MOVE=0
LADDER=1
SNAKE=2
WINNING_POSITION=100

function getNextDieRole(){

	position=$1

	if [ $position -lt $WINNING_POSITION ]
	then
		die=$((RANDOM % 6 +1))
		checkMove=$(( RANDOM % 3 ))

		case $checkMove in

			$NO_MOVE) ;;
			$LADDER)
				if [ $(( $WINNING_POSITION - $position )) -ge $die ]
				then
					position=$(( $position + $die ))
				fi;;
			$SNAKE)
				position=$(( $position - $die ))
				if [ $position -lt $START_POSITION ]
				then
					position=$START_POSITION
				fi;;
		esac

	fi
	echo $position
}

function checkWinner(){

	firstPlayerDieRole=0
	secondPlayerDieRole=0
	firstPlayerPosition=$START_POSITION
	secondPlayerPosition=$START_POSITION

	while true
	do
		firstPlayerPosition=$(getNextDieRole $firstPlayerPosition )
		firstPlayerDieRole=$(( $firstPlayerDieRole + 1 ))

		if [ $firstPlayerPosition -eq $WINNING_POSITION ]
		then
			echo -e "First player number of role Die: $firstPlayerDieRole \nSecond player number of role Die: $secondPlayerDieRole \nFirst player is winner"
			break
		fi

		secondPlayerPosition=$(getNextDieRole $secondPlayerPosition )
		secondPlayerDieRole=$(( $secondPlayerDieRole + 1 ))

		if [ $secondPlayerPosition -eq $WINNING_POSITION ]
		then
			echo -e "First player number of role Die: $firstPlayerDieRole \nSecond player number of role Die: $secondPlayerDieRole \nSecond player is winner"
			break
		fi

	done
}

checkWinner
