//
//  World.swift
//  TextDungeon
//
//  Created by iD Student on 8/8/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import Foundation

var mapArray:[[String]] = []
var map:String = ",  "

var length:Int = 50 //35 --> 50
var width:Int = 18 //should always be an even number

var character:String = ",  "  // % = swordsman, @ = mage, & = knight
var isMonster:Bool = false //help with segue-ing since you can't refrence self in this file

func generateWorld() -> [[String]] {
    
    for i in 1...length {
        var array: [String] = []
        for i in 1...width {
            array.append(map)  //position middle == mapArray[length * width / 2]
        }
        mapArray.append(array)
    }
    
    mapArray[characterPos.y][characterPos.x] = character
    
    return mapArray
}


func moveRight() {
//    nextSymb = mapArray[characterPos.y][characterPos.x + 1]
    if (mapArray[characterPos.y][characterPos.x + 1] != map && (characterPos.x + 1) <= width) {
        nextSymb = mapArray[characterPos.y][characterPos.x + 1]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.x += 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        //        checkMonster()
        isMonster = true
    }
    else if ((characterPos.x + 1) <= width) {
        nextSymb = mapArray[characterPos.y][characterPos.x + 1]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.x += 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        isMonster = false
    }
}
func moveLeft() {
//    nextSymb = mapArray[characterPos.y][characterPos.x - 1]
    if (mapArray[characterPos.y][characterPos.x - 1] != map && (characterPos.x - 1) >= 0) {
        nextSymb = mapArray[characterPos.y][characterPos.x - 1]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.x -= 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
//        checkMonster()
        isMonster = true
    }
    else if ((characterPos.x - 1) >= 0) {
        nextSymb = mapArray[characterPos.y][characterPos.x - 1]
        
    mapArray[characterPos.y][characterPos.x] = lastSymb
    
    characterPos.x -= 1
    mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        isMonster = false
    }
}
func moveUp() {
//    nextSymb = mapArray[characterPos.y - 1][characterPos.x]
    if (mapArray[characterPos.y - 1][characterPos.x] != map && (characterPos.y - 1) >= 0) {
        nextSymb = mapArray[characterPos.y - 1][characterPos.x]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.y -= 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        //        checkMonster()
        isMonster = true
    }
    else if ((characterPos.y - 1) >= 0) {
        nextSymb = mapArray[characterPos.y - 1][characterPos.x]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.y -= 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        isMonster = false
    }
}
func moveDown() {
//    nextSymb = mapArray[characterPos.y + 1][characterPos.x]
    if (mapArray[characterPos.y + 1][characterPos.x] != map && (characterPos.y + 1) <= length) {
        nextSymb = mapArray[characterPos.y + 1][characterPos.x]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.y += 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        //        checkMonster()
        isMonster = true
    }
    else if ((characterPos.y + 1) <= length) {
        nextSymb = mapArray[characterPos.y + 1][characterPos.x]
        
        mapArray[characterPos.y][characterPos.x] = lastSymb
        
        characterPos.y += 1
        mapArray[characterPos.y][characterPos.x] = character
        lastSymb = nextSymb
        isMonster = false
    }
}

func generateMobs() {
//    print("\(mapArray[boss1.x].count),  \(mapArray[boss1.y].count)")
    
    //mapArray[length][width] or mapArray[variable.y][variable.x]
    mapArray[boss1.y][boss1.x] = enemies[5].enemySymbol //bosses --> 21
    mapArray[boss2.y][boss2.x] = enemies[9].enemySymbol // 34
    mapArray[boss3.y][boss3.x] = enemies[14].enemySymbol // 49
    
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = enemies[0].enemySymbol //mini-slime
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = enemies[1].enemySymbol
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = enemies[2].enemySymbol
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = enemies[3].enemySymbol // large slime
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = enemies[4].enemySymbol
    
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = items[17].itemSymbol //pre-boss 1 items
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = items[18].itemSymbol
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = items[19].itemSymbol
    mapArray[getRandomL(0, max: boss1.y - 1)][getRandomW(0, max: width - 1)] = items[20].itemSymbol
    
    
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = enemies[6].enemySymbol //man items
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = enemies[7].enemySymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = enemies[8].enemySymbol
    
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[15].itemSymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[16].itemSymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[17].itemSymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[18].itemSymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[19].itemSymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[20].itemSymbol
    mapArray[getRandomL(boss1.y + 1, max: boss2.y - 1)][getRandomW(0, max: width - 1)] = items[21].itemSymbol
    
    
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = enemies[10].enemySymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = enemies[11].enemySymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = enemies[12].enemySymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = enemies[13].enemySymbol
    
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[15].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[16].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[17].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[18].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[19].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[20].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[21].itemSymbol
    mapArray[getRandomL(boss2.y + 1, max: boss3.y - 1)][getRandomW(0, max: width - 1)] = items[5].itemSymbol

    mapArray[characterPos.y][characterPos.x + 1] = enemies[2].enemySymbol
}

func getRandomL(min: Int, max: Int) -> Int {
    let x = Int(arc4random_uniform(UInt32(max - min))) + min
    
    return x
}
func getRandomW(min: Int, max: Int) -> Int {
    var x = Int(arc4random_uniform(UInt32(max - min))) + min
    
    while (x == width / 2) {
        x = Int(arc4random_uniform(UInt32(max - min))) + min
    }
    
    return x
}
