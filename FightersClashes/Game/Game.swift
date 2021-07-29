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
        showWinner()
    }
}

// MARK: - Convenience Methods

extension Game {
    
    private func createTeams() {
        print("The game starts, each player gives himself a name.")
        [player1, player2].enumerated().forEach { (index, player) in
            
            // Define player name
            while player.playerName.isEmpty {
                var namePlayer = player.setPlayerName(at: index)

                for name in namesUsed {
                    if namePlayer == name {
                        print("This name is already in use !")
                        namePlayer = player.setPlayerName(at: index)
                    }
                }
                namesUsed.append(namePlayer)
                player.playerName = namePlayer
            }
            print("the player name of team \(index + 1) is \(player.playerName)")
            print("\n")
            // Define team
            print("And each player forms a team of 3 fighters :")
            
            while player.fighters.count < 3 {
                
                let i = player.fighters.count + 1
                let selectedFighter = player.getTeamFighter(index: i)
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
        print("\n")
        print("the two teams are now created.")
        print("Each player takes a turn, the player 1 \(player1.playerName) starts.")
        print("Good fight .... and may the best win ....")
    }
    
    private func startBattle() {
        var player = player1
        var challenger = player2
        
        while fightersAreAlive() {
            let attacker = player.chooseAttacker()
            attacker.changeWeapon()
            let opponent = challenger.chooseOpponent()
                
            print("it's \(attacker.name) turn to face \(opponent.name)")
            player.chooseAction(attacker: attacker, opponent: opponent)
                
            numberOfRounds += 1
            swap(&player, &challenger)
        }
        print("\n")
        print("                      ***** GAME OVER *****")
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
    
     private func fightersAreAlive() -> Bool {
        let team1 = player1.playersLifePoints()
        let team2 = player2.playersLifePoints()
        if team1 == 0 {
            winner = player2
        }
        if team2 == 0 {
            winner = player1
        }
        // true && true ==> true (game in progress)
        // true && false ==> false (game over)
        // vs true || false ==> true
        return team1 > 0 && team2 > 0
    }
}
