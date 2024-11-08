# connect_four
Connect four game in ruby with rspec as a tester

rules: 
-Decide who goes first.
-Players take turns dropping discs into any column of their choice.
-The disc falls to the lowest available space in the column.
-The game ends when someone gets four-in-a-row vertically, horizontally, or diagonally.

to do:
- make gameboard class
    - build a blank board thats 7x6 grid- DONE
    - have numbers underneath for readability- DONE
    - on player/computer input drop disc
    - update image after each move


- make player class 
    - create method that drops a disc on an input of number 1-7
    - create method that increases win count on upon winning
    - create a method that tracks where chips are dropped
    - create a method that determines if there are 4 vertical, horizontal,
    or diagonal chips in a row to win
- make computer class
    - create a method that randomly chooses where to place disc
    -create method that increases win count upon winning