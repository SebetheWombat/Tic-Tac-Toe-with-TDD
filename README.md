#Unbeatable Tic-Tac-Toe

A single player game of tic-tac-toe designed to be unbeatable.

###Requirements: 

* Allows for a human player
* Has a computer player
* Computer always wins when it can
* Computer never loses

###AI Algorithm:

* Minimax: A recursive algorithm that allows the computer player to find the best possible move based on the assumption that its opponent is also trying to win. It does this by ranking winning moves positively, losing moves negatively and draws as a zero. It then returns which current move it can take that will return the maximum ranked ending game state.
