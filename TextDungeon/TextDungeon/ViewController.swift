//
//  ViewController.swift
//  TextDungeon
//
//  Created by iD Student on 8/5/16.
//  Copyright © 2016 iD Student (Stewart H.). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToStart(segue: UIStoryboardSegue) {
        print("UNWOUND TO START SCREEN")
    }

}

