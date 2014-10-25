//
//  AppDelegate.swift
//  Day7
//
//  Created by Suleyman Calik on 25.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        fireLocalNotification()
        return true
    }
    
    
    func fireLocalNotification() {
        var noti:UILocalNotification = UILocalNotification()
    }

}

