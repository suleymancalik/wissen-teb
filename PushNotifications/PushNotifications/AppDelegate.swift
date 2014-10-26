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

        registerForPush()

        /*
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
*/
        
        return true
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
        
        println("REQUEST: \(request.allHTTPHeaderFields)")
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
}









