//
//  Mage.swift
//  FightersClashes
//
//  Created by fred on 21/07/2021.
//

import Foundation

class Mage: Fighter {
    
    init() {
        super.init(name: "", type: "mage", life: 120, weapon: Spectre())
    }
}
