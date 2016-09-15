//  CharacterClass.swift
//  <=======|==O
//
//  Created by iD Student (Stewart H.) on 8/4/16.

import Foundation

//example character
//var character1:Character = Character(characterNm: "Stewart", characterStats: stats(classNm: "Mage", maxHitPt: 80, hitPt: 80, abilityPw: 25, attackDmg: 0, attackSpd: 5))

var enemyalive:Bool = true

class Character {
    var name:String
//    var characterClass:String
    var status: stats
    var inventory:[item]
    var armourItem: item
    var weaponItem: item
    var playerAlive: Bool
    
    init(characterNm: String, characterStats: stats) {
        name = characterNm
//        characterClass = characterStats.classNm
        status = characterStats
        armourItem = item(itemNm: "", itemSymb: "", itemType: "", hitBuff: 0, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 0)
        weaponItem = item(itemNm: "", itemSymb: "", itemType: "", hitBuff: 0, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 0)
        inventory = []
        playerAlive = true
        
        if (status.hp <= 0) {
            playerAlive = false
        }
    }
    
    var usedCounter:String = ""  //counter used to find it an item was used
    func use(itemConsumed:item) {
        if (itemConsumed.type == "Armour") { //also checking if equipable item was used
            armourItem = itemConsumed
        }
        if (itemConsumed.type == "Weapon") {
            weaponItem = itemConsumed
        }
        
        if ((itemConsumed.type == "Armour") && usedCounter != "") {
            usedCounter = itemConsumed.itemName
//            Character.status -= armourItem  //subtracting past item effects
            status.maxHp -= armourItem.hpBuff
            status.hp -= armourItem.hpBuff
            status.ap -= armourItem.apBuff
            status.ad -= armourItem.adBuff
            status.atkSpd -= armourItem.atkSpd
            
            status.maxHp += itemConsumed.hpBuff
            status.hp += itemConsumed.hpBuff
            status.ap += itemConsumed.apBuff
            status.ad += itemConsumed.adBuff
            status.atkSpd += itemConsumed.atkSpd
        }
        else if ((itemConsumed.type == "Weapon") && usedCounter != "") {
            usedCounter = itemConsumed.itemName
            status.maxHp -= weaponItem.hpBuff
            status.hp -= weaponItem.hpBuff
            status.ap -= weaponItem.apBuff
            status.ad -= weaponItem.adBuff
            status.atkSpd -= weaponItem.atkSpd
            
            status.maxHp += itemConsumed.hpBuff
            status.hp += itemConsumed.hpBuff
            status.ap += itemConsumed.apBuff
            status.ad += itemConsumed.adBuff
            status.atkSpd += itemConsumed.atkSpd
        }
        else {
            status.maxHp += itemConsumed.hpBuff
            status.hp += itemConsumed.hpRestore
            status.ap += itemConsumed.apBuff //equipping item buffs
            status.ad += itemConsumed.adBuff
            status.atkSpd += itemConsumed.atkSpd
        }
        
        if (itemConsumed.hpRestore + status.hp > status.maxHp) {
            status.hp = status.maxHp  //hp balancing for consumables and hp boosting items
        }
        if (status.atkSpd < 0 ) {
            status.atkSpd = 0  //balancing attack speed
        }
        
        print("\(itemConsumed.itemName) was used...")
    }
    
//    func rest(characterStatus: stats) { //restoring hp from rest
//        status.hp = status.maxHp
//    }
    
    func attack(enemyAttacked: enemy) {
//        var alive:Bool = true
        
        if (enemyalive == true) {
            if (status.ad >= status.ap) {
                enemyAttacked.hp -= status.ad
            }
            else {
                enemyAttacked.hp -= status.ap
            }
        }
        if (enemyAttacked.hp <= 0) {
            enemyalive = false
        }
    }
}


class stats {
    var className:String //class's name
    var maxHp:Int //maximum hit points
    var hp:Int //hit points
    var ap:Int //ability power
    var ad:Int //attack damage
    var atkSpd:Int //attack speed (use time/(base attack speed + item attack speed) as the mod for game action)
    var dps:Double //damage per second with highest damaging attack type
    
    init(classNm: String, maxHitPt: Int, hitPt: Int, abilityPw: Int, attackDmg: Int, attackSpd: Int) {
        className = classNm
        maxHp = maxHitPt
        hp = hitPt
        ap = abilityPw
        ad = attackDmg
        atkSpd = attackSpd
        dps = (10 / Double(atkSpd)) //auto-filled dps per character (just in case)
    }
    func hpBalance() {
        if (hp > maxHp) {
            hp = maxHp
        }
    }
}

//items
class item {
    //name
    var itemName:String
    var itemSymbol:String
    var type:String
    //stat - change
    var hpBuff:Int //base
    var adBuff:Int
    var apBuff:Int
    var atkSpd:Int
    //heals
    var hpRestore:Int //use
    
    init (itemNm: String, itemSymb: String, itemType: String, hitBuff: Int, attackBuff: Int, abilityBuff: Int, attackSpd: Int, hpRes: Int) {
        itemName = itemNm
        itemSymbol = itemSymb
        type = itemType
        hpBuff = hitBuff
        adBuff = attackBuff
        apBuff = abilityBuff
        atkSpd = attackSpd
        hpRestore = hpRes
    }
}


class enemy {
    var enemyName:String //class's name
    var enemySymbol:String
    var maxHp:Int //maximum hit points
    var hp:Int //hit points
    var ap:Int //ability power
    var ad:Int //attack damage
    var atkSpd:Int //attack speed (use time/(base attack speed + item attack speed) as the mod for game action)
    var itemHolding:item
    var dps:Double //damage per second with highest damaging attack type
    var enemyAlive:Bool
    
    init(enmyNm: String, enmySymbl: String, maxHitPt: Int, hitPt: Int, abilityPw: Int, attackDmg: Int, attackSpd: Int, itemHold: item!) {
        enemyName = enmyNm
        enemySymbol = enmySymbl
        maxHp = maxHitPt
        hp = hitPt
        ap = abilityPw
        ad = attackDmg
        atkSpd = attackSpd
        itemHolding = itemHold
        enemyAlive = true
        
        if (hp > maxHp) {
            hp = maxHp
        }
        
        dps = (10 / Double(atkSpd)) //auto-filled dps per character (just in case)
    }
    var canAttack = true
    func attackPlayer(playerAttacked: Character) {
        //        var alive:Bool = true
        
        canAttack = false
        
        if (playerAttacked.status.hp <= 0) {
            playerAttacked.playerAlive = false
        }
        
        if (playerAttacked.playerAlive == true) {
            if (ad >= ap) {
                playerAttacked.status.hp -= ad
            }
            else {
                playerAttacked.status.hp -= ap
            }
        }
//        NSTimer.scheduledTimerWithTimeInterval(10/Double(atkSpd), target: self, selector: #selector(resetAttack), userInfo: nil, repeats: false)
    }
//    @objc func resetAttack() {
//        canAttack = true
//        print("Reset")
//    }
}






