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
        var nameInput: String = ""
        
        while (nameInput.count < 2) {
            print("\n")
            print("Which NAME for number \(index + 1) PLAYER : ")
            let value = readLine()
            if let _nameInput = value {
                nameInput = _nameInput.trimmingCharacters(in: .whitespaces)
            }
        }
        
        return nameInput
    }

    // MARK: -  Configure player's
    
    // returns a fighter selected from the list of all fighters
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
   
    // returns a name for the fighterr
    func setFighterName(type: Fighter) -> String {
        var nameFighter: String = ""
        
        while (nameFighter.count < 2) {
            print("\(playerName) gives a name to this \(type.type) :")
            let value = readLine()
            if let _nameFighter = value {
                nameFighter = _nameFighter.trimmingCharacters(in: .whitespaces)
            }
        }
        
        return nameFighter
    }
    
    // MARK: - Player Round
    
    // the player chooses the attacker from his team
    func chooseAttacker() -> Fighter {
        getFighter(selectedSentence: "\n\(playerName) choose his attacker :")
    }
    
    // the player chooses his opponent from the opposing team
    func chooseOpponent() -> Fighter {
        getFighter(selectedSentence: "And choose the opponent :")
    }
    
    // the player chooses confrontation or care
    func chooseAction(player: Player, challenger: Player) {
        var action: Int = -1
        
        while (action != 1 && action != 2) {
            print("What is your strategy :")
            print("1 - Fight : The fighters chosen from each team fight against ")
            print("2 - Care : \(playerName) gives life points for one of his attackers")
            //print("2 - Care : \(playerName) gives life points to his attacker \(attacker.name) the \(attacker.type)")
            if let value = readLine(),
               let _action = Int(value) {
                action = _action
            }
        }
        if action == 1 {
            let attacker = player.chooseAttacker()
            attacker.changeWeapon()
            let opponent = challenger.chooseOpponent()
            print("it's \(attacker.name) turn to face \(opponent.name)")
            attacker.hurt(opponent: opponent)
        } else {
            let attacker = player.chooseAttacker()
            attacker.care()
        }
    }
    
    // MARK: - Control state player
    
    // description of the fighters in each team
    func playerStatus(player: Player) {
        print(" Status of \(player.playerName)'s team :")
        for fighter in player.fighters {
            print("  \(fighter.description())")
        }
        print("\n")
    }
    
    // retirns total life points of a team
    func playerLifePoints() -> Int {
        var teamLives = 0
        for life in fighters {
            teamLives += life.life
        }
        return teamLives
    }
}

extension Player {
    
    // returns a fighter chosen from those still alive in the team
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
