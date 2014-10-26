//
//  AppDelegate.swift
//  PushNotifications
//
//  Created by Suleyman Calik on 26.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let sharedApplication = UIApplication.sharedApplication()
        if sharedApplication.respondsToSelector (Selector("isRegisteredForRemoteNotifications")) {
            
            if !sharedApplication.isRegisteredForRemoteNotifications() {
                registerForPush()
            }
        }
        else {
            if sharedApplication.enabledRemoteNotificationTypes() == UIRemoteNotificationType.None {
                registerForPush()
            }
        }
        
        
        if launchOptions != nil {
            var pushDict = launchOptions![UIApplicationLaunchOptionsRemoteNotificationKey]
                as Dictionary<NSObject,AnyObject>
            var campaignId = pushDict["campaignId"] as String
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(),{ () -> Void in
                self.showCampaignId(campaignId)
            })
        }
        
        return true
    }
    
    func showCampaignId(campaignId:String) {
        var alert = UIAlertController(title: "Push Geldi", message: campaignId, preferredStyle: UIAlertControllerStyle.Alert)
        window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func registerForPush() {
        let sharedApplication = UIApplication.sharedApplication()
        
        if sharedApplication.respondsToSelector (Selector("registerUserNotificationSettings:")) {
            // iOS 8
            let pushSettings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound, categories: nil)
            sharedApplication.registerUserNotificationSettings(pushSettings)
            sharedApplication.registerForRemoteNotifications()
        }
        else {
            // iOS 7
            sharedApplication.registerForRemoteNotificationTypes(UIRemoteNotificationType.Alert | UIRemoteNotificationType.Badge | UIRemoteNotificationType.Sound)
        }
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println("PUSH REGISTER ERROR: \(error)")
    }
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        println("PUSH REGISTER SUCCESS: \(deviceToken.description)")
        
        var token = deviceToken.description
        token = token.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<>"))
        token = token.stringByReplacingOccurrencesOfString(" ", withString:"", options: NSStringCompareOptions.LiteralSearch, range: nil)
        uploadTokenToServer(token)
    }
    
    func uploadTokenToServer(token:String) {
        var url = NSURL(string: "https://api.parse.com/1/installations")
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        request.addValue("U9T26PnEU7qXbiRQSgQL0SYtdwKnyR1SF5XvjaVo", forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue("vOJLKz3vjwRLOE76096MnRQ899mQnI52QFQ7xOUg", forHTTPHeaderField: "X-Parse-REST-API-Key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var params = ["deviceToken":token, "deviceType":"ios"] as Dictionary<String, String>
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        
        if err != nil {
            println("BODY ERR: \(err)")
            return
        }
        
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil {
                println("UPLOAD SUCCESS: \(response)")
            }
            else {
                println("UPLOAD ERROR: \(error)")
            }
        }
        task.resume()
    }
    
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        var campaignId = userInfo["campaignId"] as String
        println(campaignId)
    }
}









