//
//  Game.swift
//  FightersClashes
//
//  Created by fred on 12/07/2021.
//

import Foundation

class Game {
    
    var player1 = Player(playerName: "", fighters: [])
    var player2 = Player(playerName: "", fighters: [])
    private var winner: Player?
    private var namesUsed = [String]()
    
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
            
            // Define player name
            
            player.setPlayerName(at: index)
            
            // Define team
            print("Each player forms a team of 3 fighters :")
            
            while player.fighters.count < 3 {
                
                
                let i = player.fighters.count + 1
                let selectedFighter = player.chooseFighter(index: i)
                var nameFighter = player.setFighterName(type: selectedFighter)
                
        // Name control used

                for name in namesUsed {
                    if nameFighter == name {
                        print("This name is already in use !")
                        nameFighter = player.setFighterName(type: selectedFighter)
                    }
                }
                namesUsed.append(nameFighter)
                let fighter = Fighter(name: nameFighter, type: selectedFighter.type, life: selectedFighter.life, weapon: selectedFighter.weapon)
                player.fighters.append(fighter)
            }
        }
    }
    
    private func startBattle() {
        
        repeat {
            
            var attacker = player1.chooseAttacker()
            var adversary = player2.chooseAdversary()
            
            print("it's \(attacker.name) turn to face \(adversary.name)")
            player1.chooseAction(attacker: attacker, adversary: adversary)
            
            numberOfRounds += 1
            
            attacker = player2.chooseAttacker()
            adversary = player1.chooseAdversary()
            
            print("it's \(attacker.name) turn to face \(adversary.name)")
            player2.chooseAction(attacker: attacker, adversary: adversary)
            
            numberOfRounds += 1
            
            
        } while playersAreAlive()
        
        showWinner()
    }
    
     private func showWinner() {
        // status of the teams and winner of the game
        print("\n")
        player1.playerStatus(player: player1)
        player2.playerStatus(player: player2)
        print("\n")
        guard let winnerName = winner?.playerName else { return }
        print("The winner is \(winnerName) in \(numberOfRounds) rounds....congratulations !")
        print("\n")
    }
    
     func playersAreAlive() -> Bool {
        let firstTeam = player1.fighters
        let secondTeam = player2.fighters
        
        let atLeastOneFighterOfFirstTeamIsAlive = firstTeam.first(where: { $0.life > 0 }) != nil
        let atLeastOneFighterOfSecondTeamIsAlive = secondTeam.first(where: { $0.life > 0 }) != nil
        
        if !atLeastOneFighterOfFirstTeamIsAlive {
            winner = player2
        }
        if !atLeastOneFighterOfSecondTeamIsAlive {
            winner = player1
        }
        
        return atLeastOneFighterOfFirstTeamIsAlive && atLeastOneFighterOfSecondTeamIsAlive
    }
}
