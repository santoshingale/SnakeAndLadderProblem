#!/bin/bash -x
echo "Welcome to sanke and lader game"

START_POSITION=0
NO_MOVE=0
LADDER=1
SNAKE=2

position=$START_POSITION

die=$((RANDOM % 6 +1))
checkMove=$(( RANDOM % 3 ))

case $checkMove in
	$NO_MOVE) 
		echo "No move";;
	$LADDER)
		position=$(( $position + $die ));;
	$SNAKE)
		position=$(( $position - $die ));;
esac
