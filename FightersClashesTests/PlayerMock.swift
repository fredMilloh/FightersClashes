//
//  PlayerMock.swift
//  FightersClashesTests
//
//  Created by fred on 22/07/2021.
//

import Foundation

class PlayerMock: Player {
    
    var playerMockName: String
    var fightersMock: [Fighter]
    
    init(playerMockName: String, fightersMock: [Fighter]) {
        self.playerMockName = playerMockName
        self.fightersMock = fightersMock
        super.init(playerName: playerMockName, fighters: fightersMock)
    }
    
    override func setPlayerName(at index: Int) -> String {
        return  "luc"
    }
    
    override func getTeamFighter(index: Int) -> Fighter {
        Gladiator()
    }
    
}
