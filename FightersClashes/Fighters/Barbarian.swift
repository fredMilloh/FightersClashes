//
//  Barbarian.swift
//  FightersClashes
//
//  Created by fred on 21/07/2021.
//

import Foundation

class Barbarian: Fighter {
    
    init() {
        super.init(name: "", type: "barbarian", life: 105, weapon: Dagger())
    }
}
