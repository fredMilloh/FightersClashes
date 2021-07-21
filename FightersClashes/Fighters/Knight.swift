//
//  Knight.swift
//  FightersClashes
//
//  Created by fred on 21/07/2021.
//

import Foundation

class Knight: Fighter {
    init() {
        super.init(name: "", type: .knight, life: 90, weapon: Sword())
    }
}
