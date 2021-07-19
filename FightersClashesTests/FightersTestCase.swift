//
//  FightersTestCase.swift
//  FightersClashesTests
//
//  Created by fred on 05/07/2021.
//
import XCTest
@testable import FightersClashes

class FightersTestCase: XCTestCase {
    
    func testGivenBarbareIsInit_WhenBarbareIsDescrption_thenDescriptionIsNotNil() {
        
        let barbare = Fighters(name: "conan", style: .barbare, weapon: .init(type: .dagger))
        
        let fighter = barbare.description()
    
        XCTAssertNotNil(fighter)
        
    }
    
    func testGivenIsSoldierTurn_WhenSoldierHurtFoe_ThenFoeLifeDecreaseSoldierWeaponPower() {
        
        let soldier = Fighters(name: "tiery", style: .archer, weapon: .init(type: .bow))
        let foe = Fighters(name: "Dumbledore", style: .mage, weapon: .init(type: .spectre))
        
        soldier.hurt(foe: foe)
        
        XCTAssert(foe.life == 85)
    }
    
    func testGivenSoldierAttacksWithPower50_WhenFoeHasLife35_ThenFoeLifeIs0() {
        
        let soldier = Fighters(name: "klos", style: .samurai, weapon: .init(type: .saber))
        let foe = Fighters(name: "eon", style: .knight, weapon: .init(type: .sword))
        foe.life = 35
        
        soldier.hurt(foe: foe)
        
        XCTAssert(foe.life == 0)
        
    }
    
    func testGivenSoldierHas100Life_WhenIHisTurnAndPlayerCare_ThenSoldierLifeIncrease30() {
        
        let soldier = Fighters(name: "Tor", style: .gladiator, weapon: .init(type: .slicer))
        
        soldier.care()
        
        XCTAssert(soldier.life == 130)
    }
    
    func testGivenSoldierLifeUnder35_WhenSoldierChooseChangeWeapon_ThenHisWeaponBecomesTrunk() {
        //let soldier = Fighters(name: "Tor", style: .gladiator, weapon: .init(type: .slicer))
        //soldier.life = 30
        
        //var choice = Int(readLine()!)
        //choice = 1
        //let trunk: WeaponsType = .dagger
        
        
        //soldier.changeWeapon()
        
        //XCTAssert(soldier.weapon.type == trunk)
            
    }
}
