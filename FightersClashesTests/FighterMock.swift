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
    var fighterMockWeapon: Weapons
    
    init(fighterMockName: String, fighterMockType: FighterType, fighterMockLife: Int, fighterMockWeapon: Weapons) {
        self.fighterMockName = fighterMockName
        self.fighterMockType = fighterMockType
        self.fighterMockLife = fighterMockLife
        self.fighterMockWeapon = fighterMockWeapon
        super.init(name: fighterMockName, type: fighterMockType, life: fighterMockLife, weapon: fighterMockWeapon)
    }
    
    override func changeWeapon() {
        self.fighterMockWeapon = Slicer()
    }
}
