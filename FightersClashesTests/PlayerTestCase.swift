//
//  PlayerTestCase.swift
//  FightersClashesTests
//
//  Created by fred on 22/07/2021.
//

import XCTest
@testable import FightersClashes

class PlayerTestCase: XCTestCase {
    
    let first = Archer()
    let second = Barbarian()
    let third = Samurai()
    let fourth = Gladiator()
    let fifth = Knight()
    let sixth = Mage()

    func test_player_set_his_name_when_this_name_is_luc_then_playerName_became_luc() {
        
        let fighters = [first, second, third]
        let playerMock = PlayerMock(playerMockName: "", fightersMock: fighters)
        
        playerMock.playerMockName = playerMock.setPlayerName(at: 1)
        
        XCTAssertEqual(playerMock.playerMockName, "luc")
    }
    
    func test_when_a_player_chooses_a_fighter_then_the_fighter_is_well_defined() {
        
        let fighters = [fourth, fifth, sixth]
        let playerMock = PlayerMock(playerMockName: "", fightersMock: fighters)
        
        playerMock.fightersMock[0] = playerMock.getTeamFighter(index: 0)
        
        XCTAssertEqual(playerMock.fightersMock[0].life, 100)
    }
}
