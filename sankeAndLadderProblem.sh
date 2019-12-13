#!/bin/bash -x
echo "Welcome to sanke and lader game"

START_POSITION=0
NO_MOVE=0
LADDER=1
SNAKE=2
WINNING_POSITION=100

declare -A gameLog

position=$START_POSITION

function snakeAndLadderSimulator(){

	dieRoleNumber=1

	while [ $position -lt $WINNING_POSITION ]
	do
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
				if [ $position -lt 0 ]
				then
					position=$START_POSITION
				fi;;
		esac

		gameLog[$dieRoleNumber]=$position
		dieRoleNumber=$(( $dieRoleNumber + 1 ))

	done
	echo $dieRoleNumber
}

result="$(snakeAndLadderSimulator)"
