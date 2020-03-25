#!/bin/bash -x

# Problem Statement -> Setting the board for Tic Tac Toe
# Author -> Pushkar Morey
# Date -> 23/03/2020

function displayBoard() {

for (( i=0; i<3; i++ ))
do
			echo "---------------"
		for (( j=0; j<3; j++ ))
		do
			printf "|   |"
		done
			printf "\n"

done
			echo "---------------"

}
displayBoard

function assignLetter() {
state=$((RANDOM%2))
		if [[ $state -eq 1 ]]
		then
				echo "X"
		else
				echo "O"
		fi

}

player=$( assignLetter )
echo "player=$player"
