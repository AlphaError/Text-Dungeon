//
//  ItemInsertViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/11/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

class ItemInsertViewController: UIViewController {

    @IBOutlet weak var itemBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemBox.text! = "Would you like to use the \(itemFound!.itemName) item you found?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yesPress(sender: AnyObject) {
        characterP1!.use(itemFound!)
        characterP1!.inventory.append(itemFound!)
//        self.performSegueWithIdentifier("SegueToBackMain", sender: self)
    }
    
    @IBAction func noPress(sender: AnyObject) {
//        self.performSegueWithIdentifier("SegueToBackMain", sender: self)
    }
    
}
