//
//  Fighters.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Fighters {
    
    var name: String
    var style: FighterStyle
    var weapon: Weapon
    var life: Int
    
    init(name: String, style: FighterStyle, weapon: Weapon) {
        self.name = name
        self.style = style
        self.weapon = weapon
        
        switch self.style {
        case .archer:
            self.life = 80
        case .barbare:
            self.life = 70
        case .samurai:
            self.life = 100
        case .gladiator:
            self.life = 100
        case .knight:
            self.life = 90
        case .mage:
            self.life = 120
        }
    }
    
    func description() -> String {
        return ("\(self.name) the \(self.style) with \(self.life) points of life, his \(self.weapon.name) wounds of \(self.weapon.power) points.")
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
        print("\(self.name) the \(self.style) has now 30 more life points !")
    }
    
    func changeWeapon() {
        let allWeapons: [WeaponsType] = [.bow, .dagger, .saber, .slicer, .spectre, .sword]
        let randomWeapon = Int.random(in: 0...5)
        let trunk = allWeapons[randomWeapon]
        
        if self.life < 35 {
            print("\(self.name) the \(self.style) can change his weapon from a power of \(self.weapon.power) by a \(trunk) with \(self.weapon.power) power")
            var choice: Int?
            repeat {
                print("1 - yes, change my \(self.weapon.name) by : \(trunk)")
                print("2 - no....thanks")
                choice = Int(readLine()!)
            } while choice != 1 && choice != 2
            
            if choice == 1 {
                self.weapon = Weapon(type: trunk)
            }
        }
    }
}
