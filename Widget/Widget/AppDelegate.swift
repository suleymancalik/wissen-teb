//
//  AppDelegate.swift
//  Widget
//
//  Created by Suleyman Calik on 26.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        for familyName in UIFont.familyNames() {
            println(familyName)
            for name in UIFont.fontNamesForFamilyName(familyName as String) {
                println(" \(name)")
            }
        }
        
        return true
    }


}

