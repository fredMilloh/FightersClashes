//
//  FighterTestCase.swift
//  FightersClashesTests
//
//  Created by fred on 22/07/2021.
//

import XCTest
@testable import FightersClashes

class FighterTestCase: XCTestCase {
    
    func test_when_a_fighter_is_initialized_then_he_should_have_the_right_description() {
        
        //given - arrange
        let conan = Barbarian()
        conan.name = "conan"
        
        //when - act
        let fighterDescription = conan.description()
        
        //then - assert
        XCTAssertEqual(fighterDescription, "conan the barbarian with 105 points of life, his dagger wounds of 40 points.")
    }
    
    func test_when_a_soldier_hits_an_other_soldier_then_his_life_points_decrease() {
        
        let soldier1 = Archer()
        let soldier2 = Samurai()
        
        soldier1.hurt(adversary: soldier2)
        
        XCTAssertEqual(soldier2.life, 75)
    }
    
    func test_when_a_soldier_kill_an_other_soldier_then_his_life_points_remain_at_0() {
        
        let soldier1 = Gladiator()
        let soldier2 = Knight()
        soldier2.life = 25
        
        soldier1.hurt(adversary: soldier2)
        
        XCTAssertEqual(soldier2.life, 0)
    }
    
    func test_it_is_soldier1_turn_and_player_care_him_then_his_life_points_increase() {
    
        let soldier1 = Mage()
        
        soldier1.care()
        
        XCTAssertEqual(soldier1.life, 150)
    }
    
    func test_when_soldier_has_life_under_35_and_change_weapon_then_have_a_new_weapon() {
        
        let soldier = FighterMock(fighterMockName: "soldier", fighterMockType: .samurai, fighterMockLife: 25, fighterMockWeapon: .init(power: 100, name: "rope"))
        
        soldier.changeWeapon()
        
        XCTAssertEqual(soldier.fighterMockWeapon.name, "slicer")
    }
    
    func test_when_soldier_has_life_upper_35_he_can_not_change_weapon() {
        let soldier = FighterMock(fighterMockName: "soldier", fighterMockType: .samurai, fighterMockLife: 70, fighterMockWeapon: .init(power: 100, name: "rope"))
        
        soldier.changeWeapon()
        
        XCTAssertEqual(soldier.fighterMockWeapon.name, "rope")
    }
}

