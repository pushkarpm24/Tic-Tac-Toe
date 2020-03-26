#!/bin/bash -x

# Problem Statement -> Setting the board for Tic Tac Toe
# Author -> Pushkar Morey
# Date -> 23/03/2020


function displayBoard() {

for (( i=0; i<3; i++ ))
do
			echo "-----------------"
		for (( j=0; j<3; j++ ))
		do
			printf "| ${Board[$i,$j]}  |"
		done
			printf "\n"

done
			echo "-----------------"

}

declare -A Board

function makingBoard() {
local nums=0
for (( i=0; i<3; i++ ))
do
		for (( j=0; j<3; j++ ))
		do
			Board[$i,$j]=$nums
			((nums++))
		done
done

}

function assignLetter() {
state=$((RANDOM%2))
		if [[ $state -eq 1 ]]
		then
				echo "X"
		else
				echo "O"
		fi

}


function whoPlays() {

state=$((RANDOM%2))
		if [[ $state -eq 1 ]]
		then
				echo "Player Play First.."
		else
				echo "Computer play First.."
		fi
}


function winningLogic() {
local win=0

if [[ ${Board[0,0]} == "X" && ${Board[0,1]} == "X" && ${Board[0,2]} == "X" ]]
then
		win=1
elif [[ ${Board[1,0]} == "X" && ${Board[1,1]} == "X" && ${Board[1,2]} == "X" ]]
then
		win=1
elif [[ ${Board[2,0]} == "X" && ${Board[2,1]} == "X" && ${Board[2,2]} == "X" ]]
then
      win=1
elif [[ ${Board[0,0]} == "X" && ${Board[1,0]} == "X" && ${Board[2,0]} == "X" ]]
then
      win=1
elif [[ ${Board[0,1]} == "X" && ${Board[1,1]} == "X" && ${Board[2,1]} == "X" ]]
then
      win=1
elif [[ ${Board[0,2]} == "X" && ${Board[1,2]} == "X" && ${Board[2,2]} == "X" ]]
then
      win=1
elif [[ ${Board[0,0]} == "X" && ${Board[1,1]} == "X" && ${Board[2,2]} == "X" ]]
then
      win=1
elif [[ ${Board[0,2]} == "X" && ${Board[1,1]} == "X" && ${Board[2,0]} == "X" ]]
then
      win=1
fi

if [[ ${Board[0,0]} == "O" && ${Board[0,1]} == "O" && ${Board[0,2]} == "O" ]]
then
      win=1
elif [[ ${Board[1,0]} == "O" && ${Board[1,1]} == "O" && ${Board[1,2]} == "O" ]]
then
      win=1
elif [[ ${Board[2,0]} == "O" && ${Board[2,1]} == "O" && ${Board[2,2]} == "O" ]]
then
      win=1
elif [[ ${Board[0,0]} == "O" && ${Board[1,0]} == "O" && ${Board[2,0]} == "O" ]]
then
      win=1
elif [[ ${Board[0,1]} == "O" && ${Board[1,1]} == "O" && ${Board[2,1]} == "O" ]]
then
      win=1
elif [[ ${Board[0,2]} == "O" && ${Board[1,2]} == "O" && ${Board[2,2]} == "O" ]]
then
      win=1
elif [[ ${Board[0,0]} == "O" && ${Board[1,1]} == "O" && ${Board[2,2]} == "O" ]]
then
      win=1
elif [[ ${Board[0,2]} == "O" && ${Board[1,1]} == "O" && ${Board[2,0]} == "O" ]]
then
      win=1
fi

if [[ $win == 1 ]]
then
		printf "$player has won"
		displayBoard
	exit
fi
if [[ $n == 8 ]]
then
		displayBoard
		printf "This Match is Tie.."
		exit
fi

}

turn=$( whoPlays )            #called whoPlays fun and store result in turn
echo $turn

makingBoard

n=0
function playGame() {
		while [[ $n -lt 9 ]]
		do
				player=$( assignLetter )        #called assignLetter fun and store result in player
				echo "player--> $player"
				displayBoard
				read -p "Enter your position:" position
				newRI=$(($position / 3))
				newCI=$(($position % 3))
				Board[$newRI,$newCI]=$player
				winningLogic
				((n++))
		done
}
playGame
