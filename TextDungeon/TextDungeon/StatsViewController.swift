//
//  StatsViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/11/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var nameBox: UITextView!
    @IBOutlet weak var classBox: UITextView!
    @IBOutlet weak var maxHpBox: UITextView!
    @IBOutlet weak var curHpBox: UITextView!
    @IBOutlet weak var apBox: UITextView!
    @IBOutlet weak var adBox: UITextView!
    @IBOutlet weak var atkSpdBox: UITextView!
    @IBOutlet weak var dpsBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameBox.text! += characterP1!.name
        classBox.text! += characterP1!.status.className
        maxHpBox.text! += String(characterP1!.status.maxHp)
        curHpBox.text! += String(characterP1!.status.hp)
        apBox.text! += String(characterP1!.status.ap)
        adBox.text! += String(characterP1!.status.ad)
        atkSpdBox.text! += String(characterP1!.status.atkSpd)
        dpsBox.text! += String(characterP1!.status.dps)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
