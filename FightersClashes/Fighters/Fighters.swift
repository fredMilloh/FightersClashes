//
//  Fighters.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Fighters {
    
    var name: String
    var category: FightersCategory
    var weapon: Weapons
    var life: Int
    
    init(name: String, category: FightersCategory) {
        self.name = name
        self.category = category
        
        switch self.category {
        case .archer:
            self.weapon = Arc()
            self.life = 80
        case .viking:
            self.weapon = Dagger()
            self.life = 70
        case .samurai:
            self.weapon = Saber()
            self.life = 100
        case .gladiator:
            self.weapon = Hatchet()
            self.life = 100
        case .knight:
            self.weapon = Sword()
            self.life = 90
        case .mage:
            self.weapon = Spectre()
            self.life = 120
        }
    }
    
    func description() -> String {
        return ("\(self.name) the \(self.category) with \(self.life) points of life, his \(self.weapon.name) wounds of \(self.weapon.power) points.")
    }
    
    func hurt(foe: Fighters) {
            
        foe.life -= weapon.power
        if foe.life < 0 {
            foe.life = 0
        }
        print("\(foe.name) is wounded, he has \(foe.life) life points left")
    }
    
    func care() {
        self.life += 15
        print("\(self.name) the \(self.category) has now 15 more life points !")
    }
    
    func changePowerWeapon() {
        let allWeapons = [Arc(), Sword(), Saber(), Hatchet(), Dagger(), Spectre()]
        let randomNumber = Int.random(in: 1...100)
        var newWeapon: Int?
        if self.life == randomNumber {
            print("\(self.name) the \(self.category) can change his weapon")
            repeat {
                for i in 1...allWeapons.count {
                    if self.weapon.name != allWeapons[i - 1].name {
                        print("\(i) = \(allWeapons[i - 1])")
                    }
                }
                newWeapon = Int(readLine()!)
            } while newWeapon != 1 && newWeapon != 2 && newWeapon != 3 && newWeapon != 4 && newWeapon != 5 && newWeapon != 6
            self.weapon.name = allWeapons[newWeapon! - 1].name
        }
    }
}
