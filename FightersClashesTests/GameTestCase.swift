//
//  GameTestCase.swift
//  FightersClashesTests
//
//  Created by fred on 24/07/2021.
//

import XCTest

class GameTestCase: XCTestCase {
    
    let tiery = Fighter(name: "tiery", type: .archer, life: 95, weapon: .init(power: 35, name: "bow"))
    let klos = Fighter(name: "klos", type: .barbarian, life: 105, weapon: .init(power: 40, name: "dagger"))
    let yoshi = Fighter(name: "yoshi", type: .samurai, life: 110, weapon: .init(power: 50, name: "saber"))
    let pepone = Fighter(name: "pepone", type: .gladiator, life: 100, weapon: .init(power: 55, name: "slicer"))
    let eon = Fighter(name: "eon", type: .knight, life: 90, weapon: .init(power: 45, name: "sword"))
    let dumbledore = Fighter(name: "dumbledore", type: .mage, life: 120, weapon: .init(power: 60, name: "spectre"))
    
    func test_when_all_life_fighters_are_upper_0_then_playersAreAlive_method_is_true() {
        let team1 = [tiery, klos, yoshi]
        let team2 = [pepone, eon, dumbledore]
        let player1 = Player(playerName: "luc", fighters: team1)
        let player2 = Player(playerName: "marc", fighters: team2)
        let game = Game()
        game.player1 = player1
        game.player2 = player2
        
        XCTAssertEqual(game.playersAreAlive(), true)
    }
    
    func test_at_least_one_fighter_of_first_team_is_alive_then_game_is_true() {
        tiery.life = 0
        klos.life = 0
        yoshi.life = 25
        let team1 = [tiery, klos, yoshi]
        let team2 = [pepone, eon, dumbledore]
        let player1 = Player(playerName: "luc", fighters: team1)
        let player2 = Player(playerName: "marc", fighters: team2)
        let game = Game()
        game.player1 = player1
        game.player2 = player2
        
        XCTAssertEqual(game.playersAreAlive(), true)
    }
    
    func test_when_all_fighters_life_of_a_team_are_0_then_playerAreAlive_is_false_game_stop() {
        pepone.life = 0
        eon.life = 0
        dumbledore.life = 0
        let team1 = [tiery, klos, yoshi]
        let team2 = [pepone, eon, dumbledore]
        let player1 = Player(playerName: "luc", fighters: team1)
        let player2 = Player(playerName: "marc", fighters: team2)
        let game = Game()
        game.player1 = player1
        game.player2 = player2
        
        XCTAssertEqual(game.playersAreAlive(), false)
    }

}
