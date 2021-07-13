//
//  Weapons.swift
//  FightersClashes
//
//  Created by fred on 30/06/2021.
//

import Foundation

class Weapon {
   
    var type: WeaponsType
    var name: String
    var power: Int
    
    init(type: WeaponsType) {
        
        self.type = type
       
        switch self.type {
        case .bow:
            self.name = "blow"
            self.power = 35
        case .dagger:
            self.name = "dagger"
            self.power = 25
        case .saber:
            self.name = "saber"
            self.power = 50
        case .slicer:
            self.name = "slicer"
            self.power = 45
        case .sword:
            self.name = "sword"
            self.power = 30
        case .spectre:
            self.name = "spectre"
            self.power = 55
        }
    }
}
