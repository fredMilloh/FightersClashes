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
    
    private func readName() -> String {
        readLine()!
    }
    
    func setPlayerName(at index: Int) {
        repeat {
            print("\n")
            print("give a PLAYER NAME for TEAM \(index + 1): ")
            let name = readName().uppercased()
            playerName = name
        } while playerName.isEmpty

        print("the player name of team \(index + 1) is \(playerName)")
        print("\n")
    }

    // MARK: -  Configure player's
    
    private var choiceFighter: Int {
        var choice: Int?
        repeat {
            print("1 = Archer")
            print("2 = Barbarian")
            print("3 = Samurai")
            print("4 = Gladiator")
            print("5 = Knight")
            print("6 = Mage")
            print ("Your choice :")
            choice = Int(readLine()!)
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5 && choice != 6
        return choice!
    }
    
    func chooseFighter(index: Int) -> Fighter {
        print("\n")
        print("\(playerName) chooses fighter n° \(index) for his team :")
            
        let choice = choiceFighter
        
        var fighter: Fighter?
            switch choice  {
            case 1: fighter = Archer()
            case 2: fighter = Barbarian()
            case 3: fighter = Samurai()
            case 4: fighter = Gladiator()
            case 5: fighter = Knight()
            case 6: fighter = Mage()
            default: print("Unknowed choice")
            }
            return fighter!
    }
        
    func setFighterName(type: Fighter) -> String {
        var nameFighter: String?
        repeat {
            print("\(playerName) gives a name to this \(type.type) :")
            nameFighter = readLine()?.uppercased()
        } while nameFighter == nil
                
        return nameFighter ?? "rambo"
    }
    
    // MARK: - Player Round
    
    func chooseAttacker() -> Fighter {
        var teamMember: Int?
        var choice = [Int]()
        //the "choice" variables allow to select only the fighters with life
        var choice1: Int?
        var choice2: Int?
        var choice3: Int?
        repeat {
            print("\n")
            print("\(playerName) choose his attacker :")
            for i in 1...fighters.count {
                if fighters[i - 1].life > 0 {
                    choice.append(i)
                    print("\(i) = \(fighters[i - 1].description())")
                }
            }
            teamMember = Int(readLine()!)
            switch choice.count {
            case 1:
                choice1 = choice[0]
            case 2:
                choice1 = choice[0]
                choice2 = choice[1]
            case 3:
                choice1 = choice[0]
                choice2 = choice[1]
                choice3 = choice[2]
            default:
                print("unknowed")
            }
        } while teamMember != choice1 && teamMember != choice2 && teamMember != choice3
        
        return fighters[(teamMember ?? 1) - 1]
    }
    
    func chooseAdversary() -> Fighter {
        var challenger: Int?
        var choice = [Int]()
        var choice1: Int?
        var choice2: Int?
        var choice3: Int?
        repeat {
            print("And choose his adversary :")
            for i in 1...3 {
                if fighters[i - 1].life > 0 {
                    choice.append(i)
                    print("\(i) = \(fighters[i - 1].description())")
                }
            }
            challenger = Int(readLine()!)
            switch choice.count {
            case 1:
                choice1 = choice[0]
            case 2:
                choice1 = choice[0]
                choice2 = choice[1]
            case 3:
                choice1 = choice[0]
                choice2 = choice[1]
                choice3 = choice[2]
            default:
                print("unknowed")
            }
        } while challenger != choice1 && challenger != choice2 && challenger != choice3
            return fighters[(challenger ?? 1) - 1]
    }
    
    func chooseAction(attacker: Fighter, adversary: Fighter) {
        var action: Int?
        repeat {
            print("What is your strategy :")
            print("1 - Fight : \(attacker.name) the \(attacker.type) attacks \(adversary.name) the \(adversary.type) ")
            print("2 - Care : \(playerName) gives life points to his attacker \(attacker.name) the \(attacker.type)")
            action = Int(readLine()!)
        } while action != 1 && action != 2
                
            if action == 1 {
                attacker.hurt(adversary: adversary)
                attacker.changeWeapon()
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
}
