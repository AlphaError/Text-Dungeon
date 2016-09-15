//
//  NoMonsterViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/10/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

class NoMonsterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backGamePress(sender: AnyObject) {
        self.performSegueWithIdentifier("SegueToBackGame", sender: self)
    }
}
