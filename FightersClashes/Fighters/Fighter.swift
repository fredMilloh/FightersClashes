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
    
    // damage of the attack on the adversary
    func hurt(adversary: Fighter) {
        adversary.life -= weapon.power
        if adversary.life < 0 {
            adversary.life = 0
        }
        print("\(adversary.name) is wounded, he has \(adversary.life) life points left")
    }
    
    func care() {
        self.life += 30
        print("\(self.name) the \(self.type) has now 30 more life points !")
    }
 
    // MARK: - Change Weapon
    
    // random weapon proposal
    private var trunkWeapon: Weapons {
        let allWeapons: [Weapons] = [Bow(), Sword(), Saber(), Dagger(), Slicer(), Spectre()]
        let randomWeapon = Int.random(in: 0...5)
        return allWeapons[randomWeapon]
    }
    
    private func readChoice() -> Int {
        Int(readLine()!)!
    }
    
     private var choiceOfChange: Int {
        var choice: Int?
        repeat {
            print("1 - yes, change my \(self.weapon.name) by : \(trunkWeapon.name)")
            print("2 - no....thanks")
            choice = readChoice()
        } while choice != 1 && choice != 2
        return choice!
    }
    
    func changeWeapon() {
        let trunkWeapon = trunkWeapon
        if self.life < 35 {
            print("\(self.name) the \(self.type) can change his weapon from a power of \(self.weapon.power) by a \(trunkWeapon.name) with \(trunkWeapon.power) power")
            
            let choice = choiceOfChange
            if choice == 1 {
                self.weapon = trunkWeapon
            }
        }
    }
}
