//
//  AppDelegate.swift
//  Notifications
//
//  Created by wissen on 25/10/14.
//  Copyright (c) 2014 wissenakademie. All rights reserved.
//

import UIKit
import Alamofire

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
                let sharedApp = UIApplication.sharedApplication()
                if sharedApp.respondsToSelector (Selector("isRegisteredForRemoteNotifications")) {
                    if !(sharedApp.isRegisteredForRemoteNotifications()) {
                        registerForPush()
                    }
                }
                else if sharedApp.enabledRemoteNotificationTypes() == UIRemoteNotificationType.None {
                    registerForPush()
                }

            }
        }
        else {
            notification = launchOptions![UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification
        }
        return true
    }
    
    func registerForPush() {
        let sharedApp = UIApplication.sharedApplication()
        if sharedApp.respondsToSelector(Selector("registerUserNotificationSettings:"))
        {
            // Register for push in iOS 8
            let settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Sound | UIUserNotificationType.Badge, categories: nil)
            sharedApp.registerUserNotificationSettings(settings)
            sharedApp.registerForRemoteNotifications()
        }
        else
        {
            // Register for push in iOS 7
            sharedApp.registerForRemoteNotificationTypes(UIRemoteNotificationType.Badge | UIRemoteNotificationType.Sound | UIRemoteNotificationType.Alert)
        }
    }
    
    func application(application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
            var deviceTokenStr = deviceToken.description
            println("deviceTokenStr: \(deviceTokenStr)")
            deviceTokenStr = deviceTokenStr.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<>"))
            deviceTokenStr = deviceTokenStr.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            println("Taken deviceTokenStr: \(deviceTokenStr)")
            sendPushTokenToServer(deviceTokenStr)
//            DataCenter.updateUserDeviceToken(deviceTokenStr)
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
    
    //MARK: - Server
    
    func sendPushTokenToServer(token:String) {
        
        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders
            = [
                "X-Parse-Application-Id" : "U9T26PnEU7qXbiRQSgQL0SYtdwKnyR1SF5XvjaVo",
                "X-Parse-REST-API-Key"   : "vOJLKz3vjwRLOE76096MnRQ899mQnI52QFQ7xOUg",
                "Content-Type"           : "application/json"]
        
        let parameters = [
            "deviceType": "ios",
            "deviceToken": token,
        ]
        Alamofire.request(.POST,"https://api.parse.com/1/installations", parameters: parameters, encoding:.JSON).response { (request, response, data, error) -> Void in
            if error == nil {
                println("installation successful!")
            } else {
                println("installation ERROR: \(error)")
            }
        }
    }
}








