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

	if [ $position -eq $WINNING_POSITION ]
	then
		winner=$2
	fi
	echo "$position $winner"
}

function checkWinner(){

	winner="null"
	numberOfDieRole=0
	firstPlayerPosition=$START_POSITION
	secondPlayerPosition=$START_POSITION

	while [ $firstPlayerPosition -lt $WINNING_POSITION ] && [ $secondPlayerPosition -lt $WINNING_POSITION ]
	do
		read firstPlayerPosition winner < <(getNextDieRole $firstPlayerPosition "First Player")
		read secondPlayerPosition winner < <(getNextDieRole $secondPlayerPosition "Second Player")
		numberOfDieRole=$(( numberOfDieRole + 1 ))
	done
	echo -e "\n$winner is winner\nnumber of role Die: $numberOfDieRole"
}

checkWinner
