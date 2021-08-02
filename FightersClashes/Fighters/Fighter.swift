//
//  Fighters.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Fighter {
   
    var name: String
    var type: String
    var life: Int
    var weapon: Weapon
    
    static var allFighters: [Fighter] = [Archer(), Barbarian(), Samurai(), Gladiator(), Knight(), Mage()]
    
    init(name: String, type: String, life: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
    }
    
    // MARK: - Convenience Methods
    
    func description() -> String {
        ("\(self.name) the \(self.type) with \(self.life) points of life, his \(self.weapon.name) wounds of \(self.weapon.power) points.")
    }
    
    // damage of the attack on the opponent
    func hurt(opponent: Fighter) {
        opponent.life -= weapon.power
        if opponent.life < 0 {
            opponent.life = 0
        }
        print("\(opponent.name) is wounded, he has \(opponent.life) life points left")
    }
    
    // care of the fighter
    func care() {
        self.life += 30
        print("\(self.name) the \(self.type) has now 30 more life points !")
    }
 
    // MARK: - Change Weapon
    
    func changeWeapon() {
        let chestWeapon = Weapon.getRandomWeapon()
        let randomCondition = Int.random(in: 0...10) % 2 == 1
        
        if randomCondition && life < 70 {
            print("\(self.name) the \(self.type) can open this chest,")
            print(" and exchange his weapon with the one in the chest.")
            
            var choice: Int = -1
            while (choice != 1 && choice != 2) {
                print("1 - yes, open the chest and exchange !")
                print("2 - no....thanks")
                if let value = readLine(),
                   let _choice = Int(value) {
                    choice = _choice
                }
            }
            if choice == 1 {
                print("\(self.name) traded his \(self.weapon.name)")
                print(" for a \(chestWeapon.name) with power \(chestWeapon.power) points")
                print("\n")
                self.weapon = chestWeapon
            }
        }
    }
}
