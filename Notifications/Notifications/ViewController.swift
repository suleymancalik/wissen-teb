//
//  ViewController.swift
//  Notifications
//
//  Created by wissen on 25/10/14.
//  Copyright (c) 2014 wissenakademie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
        var appDel = UIApplication.sharedApplication().delegate  as AppDelegate
        if let notification:UILocalNotification = appDel.notification {
            var userInfo:Dictionary = notification.userInfo!
            var userId: AnyObject? = userInfo["userId"]
            showAlert(userId as String)
        }
    }
    
    func showAlert(userId:String) {
        var action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        var alert = UIAlertController(title: "User ID", message: userId, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}

