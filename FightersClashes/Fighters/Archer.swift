//
//  Archer.swift
//  FightersClashes
//
//  Created by fred on 21/07/2021.
//

import Foundation

class Archer: Fighter {
    
    init() {
        super.init(name: "", type: "archer", life: 95, weapon: Bow())
    }
}
