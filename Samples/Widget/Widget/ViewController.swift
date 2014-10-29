//
//  ViewController.swift
//  Widget
//
//  Created by Suleyman Calik on 26.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionSave(sender: AnyObject) {
        
        if !textfield.text.isEmpty {
            
            var sharedUserDefaults = NSUserDefaults(suiteName: "group.wissen.TodayDefaults")
            sharedUserDefaults?.setObject(textfield.text, forKey:"text")
            sharedUserDefaults?.synchronize()
        }
    }
}







