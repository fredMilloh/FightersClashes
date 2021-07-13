//
//  Game.swift
//  FightersClashes
//
//  Created by fred on 12/07/2021.
//

import Foundation

class Game {
    
    var player1 = Players(playerName: "", fighters: [Fighters]())
    var player2 = Players(playerName: "", fighters: [Fighters]())
    var namesUsed = [String]()
    
    private var numberOfRounds = 0
    
    func start() {
        createTeams()
        startBattle()
    }
}

// MARK: - Convenience Methods

extension Game {
    
    private func createTeams() {
        [player1, player2].enumerated().forEach { (index, player) in
            
            player.giveTeamName(index: index, player: player)
            
            print("Each player forms a team of 3 fighters :")
            
            while player.fighters.count < 3 {
                let i = player.fighters.count + 1
                let style = player.chooseStyle(index: i)
                let weapon = player.chooseWeapon(index: i)
                var nameFighter = player.giveFighterName(style: style)
                
        // Name control used

                for name in namesUsed {
                    if nameFighter == name {
                        print("This name is already in use !")
                        nameFighter = player.giveFighterName(style: style)
                    }
                }
                namesUsed.append(nameFighter)
                let fighter = Fighters(name: nameFighter, style: style, weapon: weapon)
                player.fighters.append(fighter)
            }
        }
    }
    
    private func startBattle() {
        
        repeat {
            var soldier = player1.chooseFighter()
            var foe = player2.chooseFoe()
            
            print("it's \(soldier.name) turn to face \(foe.name)")
            player1.chooseAction(soldier: soldier, foe: foe)
            
            numberOfRounds += 1
            
            soldier = player2.chooseFighter()
            foe = player1.chooseFoe()
            
            print("it's \(soldier.name) turn to face \(foe.name)")
            player2.chooseAction(soldier: soldier, foe: foe)
            
            numberOfRounds += 1
            
            
        } while player1.totalLivesPoint() > 0 && player2.totalLivesPoint() > 0
        
        showWinner()
    }
    
    private func showWinner() {
        // status of the teams and winner of the game
        print("\n")
        player1.teamStatus(player: player1)
        player2.teamStatus(player: player2)
        
        if player1.fighters.count == 0 {
            print("The winner is \(player1.playerName) in \(numberOfRounds) rounds....congratulations !")
        } else {
            print("The winner is \(player2.playerName) in \(numberOfRounds) rounds....congratulations !")
        }
    }
}
