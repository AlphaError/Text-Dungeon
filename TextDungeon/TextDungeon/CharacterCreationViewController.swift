//
//  CharacterCreationViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/5/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

var characterP1: Character? = nil  //optional character generation

class CharacterCreationViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var namebox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        classType.append(stats(classNm: "Mage", maxHitPt: 90, hitPt: 90, abilityPw: 30, attackDmg: 0, attackSpd: 4)) //mage class  --> tons of ap damage
        classType.append(stats(classNm: "Knight", maxHitPt: 160, hitPt: 160, abilityPw: 0, attackDmg: 10, attackSpd: 5)) //knight class --> health/defense and ad
        classType.append(stats(classNm: "Swordsman", maxHitPt: 110, hitPt: 110, abilityPw: 0, attackDmg:20, attackSpd: 7)) //swordsman class --> decent health with ad (capabale of buffing)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //classes
    var classType:[stats] = [] //creating an array that can hold the types of base character stats
    var x:String = ""
    func voltChange() {
        if (namebox.text! == "Volt") {
            x = "⚡⚡"
        }
    }
    func stewChange() {
        if (namebox.text! == "Stew" || namebox.text! == "Stewart") {
            x = "ヾ(＾∇＾)"
        }
    }
    
    @IBAction func magePress(sender: AnyObject) {
        voltChange()
        stewChange()
        
        characterP1 = Character(characterNm: namebox.text! + x, characterStats: classType[0])  //if button pressed, creates existant class depending on classType
        character = "@  "
    }
    
    @IBAction func swordsmanPress(sender: AnyObject) {
        voltChange()
        stewChange()
        
        characterP1 = Character(characterNm: namebox.text! + x, characterStats: classType[2])
        character = "%  "
    }
    
    @IBAction func knightPress(sender: AnyObject) {
        voltChange()
        stewChange()
        
        characterP1 = Character(characterNm: namebox.text! + x, characterStats: classType[1])
        character = "&  "
    }
    
    
    
}
