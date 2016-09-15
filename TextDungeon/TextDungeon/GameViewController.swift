//
//  GameViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/5/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

var items:[item] = []
var enemies:[enemy] = []

var characterPos:(x: Int, y: Int) = (width / 2, 2)
//boss positions
var boss1:(x:Int, y:Int) = (width / 2, 21)
var boss2:(x:Int, y:Int) = (width / 2, 34)
var boss3:(x:Int, y:Int) = (width / 2, 49)

var lastSymb:String = map //movement help
var nextSymb:String = map

var enemyFound:enemy? = nil
var itemFound:item? = nil

//var enemyAlive:Bool = true

var stuffAppended:Bool = false

class GameViewController: UIViewController {
    
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var classBox: UITextField!
    @IBOutlet weak var inventoryBox: UITextView!
    
    @IBOutlet weak var gameBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBox.font = UIFont(name: "Courier", size: 11)
        classBox.font = UIFont(name: "Courier", size: 10)
        inventoryBox.font = UIFont(name: "Courier", size: 10)
        nameBox.font = UIFont(name: "Courier", size: 10)
        
        gameBox.allowsEditingTextAttributes = false
        nameBox.allowsEditingTextAttributes = false
        classBox.allowsEditingTextAttributes = false
        inventoryBox.allowsEditingTextAttributes = false
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if (stuffAppended == false) {
            //Shields
            items.append(item(itemNm: "Weak Shield", itemSymb: ";  ",itemType: "Armour", hitBuff: 15, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 0))
            items.append(item(itemNm: "Medium Shield", itemSymb: "#  ", itemType: "Armour", hitBuff: 30, attackBuff: 0, abilityBuff: 0, attackSpd: -1, hpRes: 0))
            items.append(item(itemNm: "Strong Shield", itemSymb: "~  ", itemType: "Armour", hitBuff: 40, attackBuff: 0, abilityBuff: 0, attackSpd: -2, hpRes: 0))
            //Clothing
            items.append(item(itemNm: "Tattered Cloth", itemSymb: "-  ", itemType: "Armour", hitBuff: 10, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 0))
            items.append(item(itemNm: "Thick Cloth", itemSymb: "+  ", itemType: "Armour", hitBuff: 20, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 0))
            items.append(item(itemNm: "Cloth Robe", itemSymb: "]  ", itemType: "Armour", hitBuff: 15, attackBuff: 0, abilityBuff: 10, attackSpd: 0, hpRes: 0))
            //Weapons
            items.append(item(itemNm: "Small Knife", itemSymb: "/  ", itemType: "Weapon", hitBuff: 0, attackBuff: 5, abilityBuff: 0, attackSpd: 1, hpRes: 0))  //knife
            items.append(item(itemNm: "Large Knife", itemSymb: "|  ", itemType: "Weapon", hitBuff: 0, attackBuff: 15, abilityBuff: 0, attackSpd: 0, hpRes: 0))
            
            items.append(item(itemNm: "Medium Axe", itemSymb: "<  ", itemType: "Weapon", hitBuff: 5, attackBuff: 15, abilityBuff: 0, attackSpd: -1, hpRes: 0))  //axe
            items.append(item(itemNm: "Large Spike-Mace", itemSymb: ">  ", itemType: "Weapon", hitBuff: 10, attackBuff: 20, abilityBuff: 0, attackSpd: -1, hpRes: 0))
            
            /*10*/items.append(item(itemNm: "Sword", itemSymb: "`  ", itemType: "Weapon", hitBuff: 0, attackBuff: 10, abilityBuff: 5, attackSpd: 0, hpRes: 0))
            items.append(item(itemNm: "Long-Sword", itemSymb: "_  ", itemType: "Weapon", hitBuff: 0, attackBuff: 20, abilityBuff: 5, attackSpd: -1, hpRes: 0))
            items.append(item(itemNm: "Broad-Sword", itemSymb: "=  ", itemType: "Weapon", hitBuff: 10, attackBuff: 15, abilityBuff: 0, attackSpd: -1, hpRes: 0))
            
            items.append(item(itemNm: "Staff", itemSymb: "[  ", itemType: "Weapon", hitBuff: 5, attackBuff: 0, abilityBuff: 15, attackSpd: 0, hpRes: 0))
            items.append(item(itemNm: "Magic-Infused Staff", itemSymb: "{  ", itemType: "Weapon", hitBuff: 0, attackBuff: 5, abilityBuff: 30, attackSpd: -2, hpRes: 20))
            
            //Consumables
            /*15*/items.append(item(itemNm: "Warrior Spirit", itemSymb: "*  ", itemType: "Consumable", hitBuff: 0, attackBuff: 5, abilityBuff: 0, attackSpd: 1, hpRes: 50)) //spirit
            items.append(item(itemNm: "Mage Spirit", itemSymb: ":  ", itemType: "Consumable", hitBuff: 0, attackBuff: 0, abilityBuff: 5, attackSpd: 1, hpRes: 40))
            items.append(item(itemNm: "Volt Spirit", itemSymb: "*. ", itemType: "Volt", hitBuff: 20, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 120)) //YOUR WELCOME VOLT!
            
            items.append(item(itemNm: "Apple", itemSymb: "A  ", itemType: "Consumable", hitBuff: 0, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 50)) //food
            items.append(item(itemNm: "Pear", itemSymb: "P  ", itemType: "Consumable", hitBuff: 0, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 40))
            /*20*/items.append(item(itemNm: "Strawberry", itemSymb: "St ", itemType: "Consumable", hitBuff: 0, attackBuff: 0, abilityBuff: 0, attackSpd: 0, hpRes: 10)) //multiple should occur (be found) at a time
            items.append(item(itemNm: "Volt-Ticket", itemSymb: "*, ", itemType: "Volt", hitBuff: 10, attackBuff: 0, abilityBuff: 0, attackSpd: 1, hpRes: 40)) //YOUR WELCOME VOLT!
            
            //enemies  --> capital = large monster, lower case = small monoster
            enemies.append(enemy(enmyNm: "Small Slime", enmySymbl: "s  ", maxHitPt: 20, hitPt: 20, abilityPw: 10, attackDmg: 0, attackSpd: 5, itemHold: items[3])) // 1
            enemies.append(enemy(enmyNm: "Small Slime", enmySymbl: "a  ", maxHitPt: 20, hitPt: 20, abilityPw: 10, attackDmg: 0, attackSpd: 5, itemHold: items[0])) // 2
            enemies.append(enemy(enmyNm: "Small Slime", enmySymbl: "b  ", maxHitPt: 20, hitPt: 20, abilityPw: 10, attackDmg: 0, attackSpd: 5, itemHold: items[4])) // 3
            
            enemies.append(enemy(enmyNm: "Large Slime", enmySymbl: "S  ", maxHitPt: 50, hitPt: 50, abilityPw: 15, attackDmg: 5, attackSpd: 4, itemHold: items[4])) // 1
            enemies.append(enemy(enmyNm: "Large Slime", enmySymbl: "x  ", maxHitPt: 50, hitPt: 50, abilityPw: 15, attackDmg: 5, attackSpd: 4, itemHold: items[4])) // 2
            /*5*/enemies.append(enemy(enmyNm: "Minotaur", enmySymbl: "B1 ", maxHitPt: 90, hitPt: 90, abilityPw: 0, attackDmg: 30, attackSpd: 6, itemHold: items[8])) //boss #1
            
            enemies.append(enemy(enmyNm: "Deprived Man", enmySymbl: "m  ", maxHitPt: 40, hitPt: 40, abilityPw: 0, attackDmg: 20, attackSpd: 5, itemHold: items[6]))
            enemies.append(enemy(enmyNm: "Deprived Man", enmySymbl: "l  ", maxHitPt: 40, hitPt: 40, abilityPw: 0, attackDmg: 20, attackSpd: 5, itemHold: items[6]))
            enemies.append(enemy(enmyNm: "Lowly Soldier", enmySymbl: "d  ", maxHitPt: 70, hitPt: 70, abilityPw: 0, attackDmg: 20, attackSpd: 6, itemHold: items[6]))
            enemies.append(enemy(enmyNm: "Wandering Swordsman", enmySymbl: "B2 ", maxHitPt: 100, hitPt: 100, abilityPw: 0, attackDmg: 50, attackSpd: 7, itemHold: items[11])) //boss #2
            
            /*10*/enemies.append(enemy(enmyNm: "Mageling", enmySymbl: "v  ", maxHitPt: 80, hitPt: 80, abilityPw: 50, attackDmg: 0, attackSpd: 4, itemHold: items[13]))
            enemies.append(enemy(enmyNm: "Mageling", enmySymbl: "V  ", maxHitPt: 80, hitPt: 80, abilityPw: 50, attackDmg: 0, attackSpd: 4, itemHold: items[13]))
            enemies.append(enemy(enmyNm: "Mageling", enmySymbl: "g  ", maxHitPt: 80, hitPt: 80, abilityPw: 50, attackDmg: 0, attackSpd: 4, itemHold: items[13]))
            enemies.append(enemy(enmyNm: "Mageling", enmySymbl: "h  ", maxHitPt: 80, hitPt: 80, abilityPw: 50, attackDmg: 0, attackSpd: 4, itemHold: items[13]))
            enemies.append(enemy(enmyNm: "High-Mage", enmySymbl: "B3 ", maxHitPt: 100, hitPt: 100, abilityPw: 70, attackDmg: 0, attackSpd: 5, itemHold: items[14])) //boss #3
            
            nameBox.text! +=  characterP1!.name //setting text box values for each user
            classBox.text! += characterP1!.status.className
            
            // Do any additional setup after loading the view.
            
            generateWorld()
//            drawMap()
            
            generateMobs()
            
            stuffAppended = true
        }
        inventoryBox.text = "Inventory: "
            for i in 0..<characterP1!.inventory.count { //for loop for mulitple items in the array
                inventoryBox.text! += "\(characterP1!.inventory[i].itemName), "
            }
        drawMap()
    }
    
//    @IBAction func statsPress(sender: AnyObject) {
//    }
    
    
    func drawMap() {  //for loop to print out map
        gameBox.text = ""
        for i in 0 ..< mapArray.count {
            for j in 0 ..< mapArray[i].count {
                gameBox.text! += mapArray[i][j]
            }
            gameBox.text! += "\n"
        }
    }
    
    func checkItem() {
        for i in 0..<items.count {
            if (nextSymb == items[i].itemSymbol) {
                itemFound = items[i]
            }
        }
        self.performSegueWithIdentifier("SegueToItem", sender: self)
    }
    
    func checkMonster() {  //checking if there is a monster and setting the data of said monster into the enemyFound enemy
        var enemyCountHelp:Int = 0 // another helper
        for i in 1...enemies.count {
            if (nextSymb == enemies[enemyCountHelp].enemySymbol) {
                enemyFound = enemies[enemyCountHelp]
            }
            enemyCountHelp += 1
        }
        if (enemyFound?.enemyAlive == true) {
            self.performSegueWithIdentifier("SegueToAttackScreen", sender: self)
        }
        else if (enemyFound?.enemyAlive == false) {
//            self.performSegueWithIdentifier("SegueToNoMonster", sender: self)
        }
        //            enemyAlive = false
    }
    
    @IBAction func northButton(sender: AnyObject) {
        moveUp()
        drawMap()
//        self.performSegueWithIdentifier("SegueToAttackScreen", sender: self)
        if (isMonster == true) {
            checkMonster()
            checkItem()
        }
    }
    @IBAction func southButton(sender: AnyObject) {
        moveDown()
        drawMap()
        if (isMonster == true) {
            checkMonster()
            checkItem()
        }
    }
    @IBAction func eastButton(sender: AnyObject) {
        moveRight()
        drawMap()
        if (isMonster == true) {
            checkMonster()
            checkItem()
        }
    }
    @IBAction func westButton(sender: AnyObject) {
        moveLeft()
        drawMap()
        if (isMonster == true) {
            checkMonster()
            checkItem()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segueBackToMain(segue: UIStoryboardSegue) {
    }
    
}
