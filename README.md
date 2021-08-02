# FightersClashes
RPG game model in macOS project, "Command Line Tool" template, 
interaction in the console with the readLine() method. 
Added a new target "Unit Testing Bundle", for some unit tests.

Game :
- each player chooses a name
- each player builds his team of 3 fighters
- to build his team, each player chooses 3 fighters from a list and gives a different name to each of them
- each name must be unique in the game

Fighter :
- the first player chooses the confrontation or care
- If there is care, the player chooses a fighter from his team to give him more life points
- If there is a confrontation :
- the player chooses an attacker from his team
- then an opponent in the opposite team
- the power of the weapon hurts the opponent (less life points)

- It's player 2's turn to choose his strategy, etc..

- randomly a weapon chest may appear to the current player, and offer to open a chest
- the player can then accept or refuse 
- if the safe is opened there is a weapon exchange  

Game over
- when all the fighters of a team have no more life, the game is over
- the winner is the team with at least one living fighter

![DiagClass](https://user-images.githubusercontent.com/47221695/127837507-63b462a4-2809-40fd-822c-c5ee6f4dc32a.png)
