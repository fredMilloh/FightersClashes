//
//  Weapons.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Weapon {
    
    var name: String
    var power: Int
    
    init(power: Int, name: String) {
        self.power = power
        self.name = name
    }
    
    static let allWeapons: [Weapon] = [Bow(), Sword(), Saber(), Dagger(), Slicer(), Spectre()]
    
    // returns a weapon randomly
    static func getRandomWeapon() -> Weapon {
        let randomWeapon = Int.random(in: 0...allWeapons.count - 1)
        return allWeapons[randomWeapon]
    }
}
