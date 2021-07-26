//
//  FighterMock.swift
//  FightersClashesTests
//
//  Created by fred on 22/07/2021.
//

import Foundation

class FighterMock: Fighter {
    
    var fighterMockName: String
    var fighterMockType: FighterType
    var fighterMockLife: Int
    var fighterMockWeapon: Weapon
    
    init(fighterMockName: String, fighterMockType: FighterType, fighterMockLife: Int, fighterMockWeapon: Weapon) {
        self.fighterMockName = fighterMockName
        self.fighterMockType = fighterMockType
        self.fighterMockLife = fighterMockLife
        self.fighterMockWeapon = fighterMockWeapon
        super.init(name: fighterMockName, type: fighterMockType, life: fighterMockLife, weapon: fighterMockWeapon)
    }
    
    override func changeWeapon() {
        if self.fighterMockLife < 35 {
            self.fighterMockWeapon = Slicer()
        }
    }
    
    
    
}
