//
//  EquipmentViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/9/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

//var inventoryItemAppended:Int = 0

class EquipmentViewController: UIViewController {

    @IBOutlet weak var display: UITextView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerSym: UILabel!
    
    @IBOutlet weak var enemyName: UILabel!
    @IBOutlet weak var enemySym: UILabel!
    
    @IBOutlet weak var playerHealth: UITextField!
    @IBOutlet weak var enemyHealth: UITextField!
    
    @IBOutlet weak var rewardBox: UITextView!
    
    @IBOutlet weak var atkTimeBox: UITextView!
    @IBOutlet weak var attackDisplay: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        display.text! = "You have encountered \(enemyFound!.enemyName)!"
        playerName.text! = characterP1!.name
        playerSym.text! = character
        rewardBox.text! = "Slay the beast and be rewarded with a(n) \(enemyFound!.itemHolding.itemName)."
        playerHealth.text! = "Health: \(String(characterP1!.status.hp))"
        enemyName.text! = enemyFound!.enemyName
        enemySym.text! = enemyFound!.enemySymbol
        enemyHealth.text = "Health: \(enemyFound!.hp)"
        
        atkTimeBox.text! = "You can attack every \(Int(characterP1!.status.dps))-ish second(s)..."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var canAttack:Bool = true
//    var canAttack2:Bool = true
    
    @IBAction func attackPressed(sender: AnyObject) {
        if (canAttack ==  false) {
            attackDisplay.text! = "Still Recharging..."
            return
        }
        else {
            attackDisplay.text! = "Ready to Attack"
            
            characterP1!.attack(enemyFound!)  //creating attack function
            enemyHealth.text = "Health: \(String(enemyFound!.hp))"
            
            if (enemyalive == false) {
                enemyFound!.enemyAlive = false
                
//                if (inventoryItemAppended == 0) {
                    characterP1!.inventory.append(enemyFound!.itemHolding)
                    print("Added item")
//                    inventoryItemAppended = 1
//                }
                
                self.performSegueWithIdentifier("SegueToItem", sender: self)
                return
            }
//            else if (enemyalive == true) {
//                inventoryItemAppended = 0
//            }
            canAttack = false
        }
        NSTimer.scheduledTimerWithTimeInterval(10/Double(characterP1!.status.atkSpd), target: self, selector: #selector(resetAttack), userInfo: nil, repeats: false)
        
        
//        if (characterP1!.status.atkSpd <= enemyFound!.atkSpd) {
//            print("enemy attacked")
            enemyFound!.attackPlayer(characterP1!)
            playerHealth.text! = "Health: \(String(characterP1!.status.hp))"
//        }
//        else {
//            print("enemy attacked")
//            sleep(UInt32(characterP1!.status.atkSpd - enemyFound!.atkSpd))
//            enemyFound!.attackPlayer(characterP1!)
//        }
//        if (characterP1!.playerAlive == false) {
//            self.performSegueWithIdentifier("SegueToDeath", sender: self)
//        }
        
    }

    func resetAttack() {
        canAttack = true
        print("Reset")
    }
//    func resetAttack2() {
//        canAttack2 = true
//        print("Reset2")
//    }
}
