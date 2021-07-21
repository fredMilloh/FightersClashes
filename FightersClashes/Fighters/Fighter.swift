//
//  Fighters.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Fighter {
   
    var name: String
    var type: FighterType
    var life: Int
    var weapon: Weapons
    
    init(name: String, type: FighterType, life: Int, weapon: Weapons) {
        self.name = name
        self.type = type
        self.life = life
        self.weapon = weapon
    }
    
    func description() -> String {
        return ("\(self.name) the \(self.type) with \(self.life) points of life, his \(self.weapon.name) wounds of \(self.weapon.power) points.")
    }
    
    func hurt(foe: Fighter) {
        foe.life -= weapon.power
        if foe.life < 0 {
            foe.life = 0
        }
        print("\(foe.name) is wounded, he has \(foe.life) life points left")
    }
    
    func care() {
        self.life += 30
        print("\(self.name) the \(self.type) has now 30 more life points !")
    }
 
// MARK: - Change Weapon
    
    private var trunkWeapon: Weapons {
        let allWeapons: [Weapons] = [Bow(), Sword(), Saber(), Dagger(), Slicer(), Spectre()]
        let randomWeapon = Int.random(in: 0...5)
        return allWeapons[randomWeapon]
    }
    
    func changeWeapon() {
        let trunkWeapon = trunkWeapon
        if self.life < 35 {
            print("\(self.name) the \(self.type) can change his weapon from a power of \(self.weapon.power) by a \(trunkWeapon.name) with \(trunkWeapon.power) power")
            var choice: Int?
            repeat {
                print("1 - yes, change my \(self.weapon.name) by : \(trunkWeapon.name)")
                print("2 - no....thanks")
                choice = Int(readLine()!)
            } while choice != 1 && choice != 2
            
            //let weaponChoice = changeChoice
            if choice == 1 {
                self.weapon = trunkWeapon
            }
        }
    }
}
