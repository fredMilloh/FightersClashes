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
- the first player chooses a attacker from his team
- then an opponent in the opposite team
- he chooses the confrontation of the two fighters or give life points to his fighter
- the power of the weapon hurts the opponent (less life points)
- It's player 2's turn to choose a fighter, etc..
- randomly a weapon chest may appear to the current player, and offer to change weapons
- the player can then accept or refuse the exchange

Game over
- when all the fighters of a team have no more life, the game is over
- the winner is the team with at least one living fighter

![DiagClass](https://user-images.githubusercontent.com/47221695/127518584-a0a946de-1249-42aa-8dee-d0c5e7326913.png)
