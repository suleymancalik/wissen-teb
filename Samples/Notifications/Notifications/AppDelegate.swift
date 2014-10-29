//
//  AppDelegate.swift
//  Notifications
//
//  Created by wissen on 25/10/14.
//  Copyright (c) 2014 wissenakademie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var notification:UILocalNotification?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if launchOptions == nil {
            if UIApplication.sharedApplication().isRegisteredForRemoteNotifications() {
                println("RegisteredForRemoteNotifications")
            }
            else {
                // iOS7 ise
                /*
                UIApplication.sharedApplication().registerForRemoteNotificationTypes(UIRemoteNotificationType.Alert)
                */
                //iOS8 ise
                UIApplication.sharedApplication().registerForRemoteNotifications()

            }
        }
        else {
            notification = launchOptions![UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification
        }
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // REMOTE REGISTER BASARILI
        
        var deviceTokenStr = NSString(data: deviceToken, encoding: NSASCIIStringEncoding)
        println("token: \(deviceTokenStr)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        // REMOTE REGISTER BASARISIZ
        println("REMOTE REGISTER BASARISIZ: \(error)")
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        // Uygulama acıkken push noti geldi
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        self.notification = notification
    }
    
    func registerForRemoteNoti() {
        
    }
    
    func fireLocalNoti() {
        
        var settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories:nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        var noti = UILocalNotification()
        noti.alertBody = "Hello World"
        var fireDate = NSDate(timeIntervalSinceNow:10)
        noti.fireDate = fireDate
        noti.applicationIconBadgeNumber = 1
        noti.userInfo = ["userId" : "12345"]
        UIApplication.sharedApplication().scheduleLocalNotification(noti)
    }
}








