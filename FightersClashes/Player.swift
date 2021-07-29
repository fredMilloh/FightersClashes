//
//  Players.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Player {
    
    var playerName: String
    var fighters: [Fighter]
    
    init(playerName: String, fighters: [Fighter]) {
        self.playerName = playerName
        self.fighters = fighters
    }

    // MARK: - Player name
    
    func setPlayerName(at index: Int) -> String {
        var nameInput: String?
        
        repeat {
            print("\n")
            print("Which NAME for number \(index + 1) PLAYER: ")
            let value = readLine()
            if let _nameInput = value {
                if _nameInput.count > 2 {
                    nameInput = _nameInput
                }
            }
        } while nameInput == nil
        return nameInput ?? "rambo"
    }

    // MARK: -  Configure player's
    
    func getTeamFighter(index: Int) -> Fighter {
        print("\n")
        print("\(playerName) chooses fighter n° \(index) for his team :")
        var choice: Int = 0
        
        let allFighters = Fighter.allFighters
        while (choice < 1 || choice > allFighters.count) {
            allFighters.enumerated().forEach { (index, fighter) in
                print("\(index + 1) : \(fighter.description())")
            }
            if let value = readLine(),
               let _choice = Int(value) {
                choice = _choice
            }
        }
        return allFighters[choice - 1]
    }
   
    func setFighterName(type: Fighter) -> String {
        var nameFighter: String?
        repeat {
            print("\(playerName) gives a name to this \(type.type) :")
            let value = readLine()
            if let _nameFighter = value {
                if _nameFighter.count > 2 {
                    nameFighter = _nameFighter
                }
            }
        } while nameFighter == nil
        return nameFighter ?? "rambo"
    }
    
    // MARK: - Player Round
    
    func chooseAttacker() -> Fighter {
        getFighter(selectedSentence: "\n\(playerName) choose his attacker :")
    }
    
    func chooseOpponent() -> Fighter {
        getFighter(selectedSentence: "And choose the opponent :")
    }
    
    func chooseAction(attacker: Fighter, opponent: Fighter) {
        var action: Int = -1
        
        while (action != 1 && action != 2) {
            print("What is your strategy :")
            print("1 - Fight : \(attacker.name) the \(attacker.type) attacks \(opponent.name) the \(opponent.type)")
            print("2 - Care : \(playerName) gives life points to his attacker \(attacker.name) the \(attacker.type)")
            if let value = readLine(),
               let _action = Int(value) {
                action = _action
            }
        }
        if action == 1 {
            attacker.hurt(opponent: opponent)
        } else {
            attacker.care()
        }
    }
        
    // MARK: - Control player
    
    func playerStatus(player: Player) {
        print(" Status of \(player.playerName)'s team :")
        for fighter in player.fighters {
            print("  \(fighter.description())")
        }
        print("\n")
    }
    
    func playersLifePoints() -> Int {
        var teamLives = 0
        for life in fighters {
            teamLives += life.life
        }
        return teamLives
    }
}

extension Player {
    
    private func getFighter(selectedSentence: String) -> Fighter {
        var choice: Int = 0
        
        var fightersAlive: [Fighter] = []
        for fighter in fighters {
            if fighter.life > 0 {
                fightersAlive.append(fighter)
            }
        }
        
        while (choice < 1 || choice > fightersAlive.count) {
            print(selectedSentence)
            fightersAlive.enumerated().forEach { (index, fighter) in
                print("\(index + 1) = \(fighter.description())")
            }
            
            if let value = readLine(),
               let _choice = Int(value) {
                choice = _choice
            }
        }
        
        return fightersAlive[choice - 1]
    }
}
