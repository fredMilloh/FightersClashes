//
//  Players.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Players {
    
    var playerName: String
    var fighters: [Fighters]
    
    init(playerName: String, fighters: [Fighters]) {
        self.playerName = playerName
        self.fighters = fighters
    }

// team name
    
    func giveTeamName(index: Int, player: Players) {
        repeat {
            print("\n")
            print("give a player name for team \(index + 1): ")
            player.playerName = readLine() ?? "rambo"
        } while player.playerName == "" || player.playerName == " " || player.playerName == "  "
        
        print("the player name of team \(index + 1) is \(player.playerName)")
        print("\n")
    }
 
// Build fighter
            
    func giveFighterName(category: FightersCategory) -> String {
        var nameFighter: String?
        repeat {
            print("Give a name to this \(category) :")
            nameFighter = readLine()
        } while nameFighter == "" || nameFighter == " " || nameFighter == "  "
                
            return nameFighter ?? "rambo"
    }
/*
    func nameControlUsed(nameUsed: [String], nameFighter: String, category: FightersCategory, player: Players) {
        for name in namesUsed {
            
            if nameFighter == name {
                print("This name is already in use !")
                nameFighter = player.giveFighterName(category: category)
            }
        }
        namesUsed.append(nameFighter)
        let fighter = Fighters(name: nameFighter, category: category)
        fighter.description()
        player.fighters.append(fighter)
    }
 */
    func chooseCategory(index: Int) -> FightersCategory {
        var choice: Int?
        repeat {
            print("\n")
            print("Choose the category of the fighter n° \(index) by the number :")
            print("1 = \(FightersCategory.archer)")
            print("2 = \(FightersCategory.viking)")
            print("3 = \(FightersCategory.samurai)")
            print("4 = \(FightersCategory.gladiator)")
            print("5 = \(FightersCategory.knight)")
            print("6 = \(FightersCategory.mage)")
            print ("Your choice :")
            choice = Int(readLine()!)
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5 && choice != 6
                    
        var category: FightersCategory?
            switch choice  {
                case 1:
                    category = .archer
                case 2:
                    category = .viking
                case 3:
                    category = .samurai    // refactor 1 class/fighters like weapons
                case 4:
                    category = .gladiator
                case 5:
                    category = .knight
                case 6:
                    category = .mage
                default:
                    print("Unknowed choice")
                }
            return category!
        }
    
// Prepare game
            
    func chooseFighter() -> Fighters {
        var teamMember: Int?
        repeat {
            print("\n")
            print("\(playerName) choose his fighter :")
            for i in 1...fighters.count {
                if fighters[i - 1].life > 0 {
                    print("\(i) = \(fighters[i - 1].description())")
                }
            }
            teamMember = Int(readLine()!)
        } while teamMember != 1 && teamMember != 2 && teamMember != 3
            return fighters[(teamMember ?? 1) - 1]
    }
            
    func chooseFoe() -> Fighters {
        var challenger: Int?
        repeat {
            print("And choose his foe :")
            for i in 1...3 {
                if fighters[i - 1].life > 0 {
                    print("\(i) = \(fighters[i - 1].description())")
                }
            }
            challenger = Int(readLine()!)
        } while challenger != 1 && challenger != 2 && challenger != 3
            return fighters[(challenger ?? 1) - 1]
    }
     
// Action
    func chooseAction(soldier: Fighters, foe: Fighters) {
        var action: Int?
        repeat {
            print("What is your strategy :")
            print("1 - Fight : \(soldier.name) the \(soldier.category) attacks \(foe.name) the \(foe.category) ")
            print("2 - Care : \(playerName) gives life points to his fighter \(soldier.name) the \(soldier.category)")
            action = Int(readLine()!)
        } while action != 1 && action != 2
                
            if action == 1 {
                soldier.hurt(foe: foe)
                soldier.changePowerWeapon()
            } else {
                soldier.care()
            }
    }
    
// Game control
    
    func totalLivesPoint() -> Int {
        var teamLives = 0
            for life in fighters {
                teamLives += life.life
            }
        return teamLives
    }
    
    func teamStatus(player: Players) {
        print(" Status of \(player.playerName)'s team :")
        for fighter in player.fighters {
            print("  \(fighter.description())")
        }
        print("\n")
    }
}
