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
    - on player/computer input drop disc -DONE
    - update image after each move - DONE
    - create a method that determines if there are 4 vertical, horizontal,
    or diagonal chips in a row to win -DONE
    - create a method that tracks where chips are dropped -DONE
     - update move method to account for if the move is out of bounds (i.e. if a column is full) -DONE
    - create a method that can save the game (see the method in code breaker for example) - DONE
    - create a method for starting a new game
        - provide options for loading previous save or start from scratch -the loading game part done working on starting a new game from scratch


- make player class 
    - create method that drops a disc on an input of number 1-7 -DONE
    - create method that increases win count on upon winning -DONE (not a method just part of the game loop)
    
    
    
- make computer class
    - create a method that randomly chooses where to place disc -DONE
    - create method that increases win count upon winning -DONE
    - create a more intelligent AI opponant move system
        - assign values to moves:
            moves that increase a chain horizontally, vertially, or diagonally by:
                - 1 equals 1 point
                - 2 equals 2 points
                - 3 equals 3 points
                - all other moves equals 0 points (possibly change to make it block player later)
        - try to implement minimax algorithm 