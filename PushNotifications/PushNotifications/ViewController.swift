//
//  ViewController.swift
//  PushNotifications
//
//  Created by Suleyman Calik on 26.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        
        
        
        if  let myText = userDefaults.stringForKey("mySuperString2") {
            println(myText)
        }
        else {
            userDefaults.setObject("QWERTYU", forKey: "mySuperString2")
            userDefaults.synchronize()
            
            println("String kaydedildi")
        }
        
    }


}

