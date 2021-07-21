//
//  Gladiator.swift
//  FightersClashes
//
//  Created by fred on 21/07/2021.
//

import Foundation

class Gladiator: Fighter {
    init() {
        super.init(name: "", type: .gladiator, life: 100, weapon: Slicer())
    }
}
