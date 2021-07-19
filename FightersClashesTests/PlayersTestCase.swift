//
//  PlayersTestCase.swift
//  FightersClashesTests
//
//  Created by fred on 05/07/2021.
//

import XCTest
@testable import FightersClashes

class PlayersTestCase: XCTestCase {
    
    let first = Fighters(name: "first", style: .barbare, weapon: .init(type: .slicer))
    let second = Fighters(name: "second", style: .mage, weapon: .init(type: .spectre))
    let third = Fighters(name: "third", style: .archer, weapon: .init(type: .bow))
    let fourth = Fighters(name: "first", style: .gladiator, weapon: .init(type: .dagger))
    let fifth = Fighters(name: "second", style: .knight, weapon: .init(type: .sword))
    let sixth = Fighters(name: "third", style: .samurai, weapon: .init(type: .saber))
    
    func testGivenPlayerHas2FightersAlive_WhenFightershave45And25Life_thenTotalTeamLifeIs70() {
     
        let team1 = [first, second, third]
        let player = Players(playerName: "Tim", fighters: team1)
        
        first.life = 0
        second.life = 45
        third.life = 25
        
        XCTAssert(player.totalLivesPoint() == 70)
    }
    
    func testGivenPlayerHasATeam_WhenPlayerDiscribesIt_thenHisTeamIsNotEmpty() {
        let team2 = [fourth, fifth, sixth]
        let player = Players(playerName: "Tom", fighters: team2)
        
                          
        XCTAssertNotNil(player.teamStatus(player: player))
    }
    
    func testGivenPlayerGiveTeamName_WhenNameIsEmpty_ThenPlayerGiveTeamNameAgain() {
        
        //let fighters = [first, second, third]
        //let player = Players(playerName: "", fighters: fighters)
        
        //var readName = readLine()
        //readName = "luc"
        //player.giveTeamName(index: 1)
        
        //XCTAssert(player.playerName == readName)
        
    }
}
