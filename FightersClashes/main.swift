//
//  main.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

var player1 = Players(playerName: "", fighters: [Fighters]())
var player2 = Players(playerName: "", fighters: [Fighters]())
var namesUsed = [String]()

//create teams

[player1, player2].enumerated().forEach { (index, player) in
    
    player.giveTeamName(index: index, player: player)
    
    print("Each team must include 3 fighters :")
    while player.fighters.count < 3 {
        let i = player.fighters.count + 1
        let category = player.chooseCategory(index: i)
        
        var nameFighter = player.giveFighterName(category: category)
        
// Name control used

        for name in namesUsed {
                
            if nameFighter == name {
                print("This name is already in use !")
                nameFighter = player.giveFighterName(category: category)
            }
        }
        namesUsed.append(nameFighter)
        let fighter = Fighters(name: nameFighter, category: category)
        player.fighters.append(fighter)
    }

}

// Fight

    var player = player1
    var challenger = player2

    var numberOfMoves = 2
    var numberOfRounds = 0

// loops of the game

while player1.totalLivesPoint() > 0 && player2.totalLivesPoint() >= 0 {

    // tour loop
    let soldier = player.chooseFighter()
    let foe = challenger.chooseFoe()

    while soldier.life > 0 && foe.life > 0 {
        print("it's \(soldier.name) turn to face \(foe.name)")
        player.chooseAction(soldier: soldier, foe: foe)
        if (foe.life > 0) {
            print("it's \(foe.name) turn to face \(soldier.name)")
            challenger.chooseAction(soldier: foe, foe: soldier)
            }
        numberOfMoves += 1
    }

    // Round Winner and switch winner player

    if soldier.life > 0 {
        print("\(soldier.name) wins this round in \(numberOfMoves) moves")
        if player1.totalLivesPoint() > player2.totalLivesPoint() {
            player = player1
            challenger = player2
        }
    } else {
        print("\(foe.name) wins this round in \(numberOfMoves) moves")
        player = player2
        challenger = player1
    }
    numberOfMoves = 2
    numberOfRounds += 1
    
}

// status of the teams and winner of the game
print("\n")
player1.teamStatus(player: player1)
player2.teamStatus(player: player2)

    if player1.fighters.count == 0 {
        print("The winner is \(player1.playerName) in \(numberOfRounds) rounds....congratulations !")
    } else {
        print("The winner is \(player2.playerName) in \(numberOfRounds) rounds....congratulations !")
    }
