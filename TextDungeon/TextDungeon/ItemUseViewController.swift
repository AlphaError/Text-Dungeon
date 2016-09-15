//
//  ItemUseViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/10/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

class ItemUseViewController: UIViewController {
    
    
    @IBOutlet weak var itemQuestion: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        itemQuestion.text! = "Would you like to equip the \(enemyFound!.itemHolding.itemName) item you won (add it to your stats)?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesPress(sender: AnyObject) {
        characterP1!.use(enemyFound!.itemHolding)
//        self.performSegueWithIdentifier("SegueToBackGame", sender: self)
    }

    @IBAction func noPress(sender: AnyObject) {
//        self.performSegueWithIdentifier("SegueToBackGame", sender: self)
    }
    
}
