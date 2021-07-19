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
     
//MARK: - Team name
    
    //private var readName: String {
    //    let name = readLine()?.uppercased()
    //    return name ?? "rambo"
    //}
    
    func giveTeamName(index: Int) {
        repeat {
            print("\n")
            print("give a PLAYER NAME for TEAM \(index + 1): ")
            playerName = readLine()?.uppercased() ?? "rambo"
        } while playerName == "" || playerName == " " || playerName == "  "
            
        print("the player name of team \(index + 1) is \(playerName)")
        print("\n")
    }
    
//MARK: -  Configure fighters
                
    func chooseStyle(index: Int) -> FighterStyle {
        var choice: Int?
        repeat {
            print("\n")
            print("\(playerName) choose the style of the fighter n° \(index) by the number :")
            print("1 = \(FighterStyle.archer)")
            print("2 = \(FighterStyle.barbare)")
            print("3 = \(FighterStyle.samurai)")
            print("4 = \(FighterStyle.gladiator)")
            print("5 = \(FighterStyle.knight)")
            print("6 = \(FighterStyle.mage)")
            print ("Your choice :")
            choice = Int(readLine()!)
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5 && choice != 6
                        
        var style: FighterStyle?
            switch choice  {
                case 1:
                    style = .archer
                case 2:
                    style = .barbare
                case 3:
                    style = .samurai
                case 4:
                    style = .gladiator
                case 5:
                    style = .knight
                case 6:
                    style = .mage
                default:
                    print("Unknowed choice")
            }
            return style!
    }
    
    func chooseWeapon(index: Int) -> Weapon {
        var choice: Int?
        repeat {
            print("\n")
            print("\(playerName) choose the weapon of the fighter n° \(index) by the number :")
            print("1 = \(WeaponsType.bow)")
            print("2 = \(WeaponsType.dagger)")
            print("3 = \(WeaponsType.saber)")
            print("4 = \(WeaponsType.slicer)")
            print("5 = \(WeaponsType.sword)")
            print("6 = \(WeaponsType.spectre)")
            print ("Your choice :")
            choice = Int(readLine()!)
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5 && choice != 6
                        
        var weapon: Weapon?
            switch choice  {
                case 1:
                    weapon = Weapon(type: .bow)
                case 2:
                    weapon = Weapon(type: .dagger)
                case 3:
                    weapon = Weapon(type: .saber)
                case 4:
                    weapon = Weapon(type: .slicer)
                case 5:
                    weapon = Weapon(type: .sword)
                case 6:
                    weapon = Weapon(type: .spectre)
                default:
                    print("Unknowed choice")
            }
            return weapon!
    }
    
    func giveFighterName(style: FighterStyle) -> String {
        var nameFighter: String?
        repeat {
            print("\(playerName) gives a name to this \(style) :")
            nameFighter = readLine()?.uppercased()
        } while nameFighter == "" || nameFighter == " " || nameFighter == "  "
                
            return nameFighter ?? "rambo"
    }
    
//MARK: - Round
    
    func chooseFighter() -> Fighters {
        var teamMember: Int?
        var choice = [Int]()
        //the "choice" variables allow to select only the fighters with life
        var choice1: Int?
        var choice2: Int?
        var choice3: Int?
        repeat {
            print("\n")
            print("\(playerName) choose his fighter :")
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
    
    func chooseFoe() -> Fighters {
        var challenger: Int?
        var choice = [Int]()
        var choice1: Int?
        var choice2: Int?
        var choice3: Int?
        repeat {
            print("And choose his foe :")
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
    
    func chooseAction(soldier: Fighters, foe: Fighters) {
        var action: Int?
        repeat {
            print("What is your strategy :")
            print("1 - Fight : \(soldier.name) the \(soldier.style) attacks \(foe.name) the \(foe.style) ")
            print("2 - Care : \(playerName) gives life points to his fighter \(soldier.name) the \(soldier.style)")
            action = Int(readLine()!)
        } while action != 1 && action != 2
                
            if action == 1 {
                soldier.hurt(foe: foe)
                soldier.changeWeapon()
            } else {
                soldier.care()
            }
    }
    
//MARK: - Control game
    
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
