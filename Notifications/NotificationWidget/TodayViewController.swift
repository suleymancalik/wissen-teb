//
//  TodayViewController.swift
//  NotificationWidget
//
//  Created by Suleyman Calik on 25.10.2014.
//  Copyright (c) 2014 wissenakademie. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblBadgeCount: UILabel!
    var badgeNumber:Int? = 0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("updateBadgeNumber"), name: NSUserDefaultsDidChangeNotification, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        preferredContentSize = CGSizeMake(320, 50)
        updateBadgeNumber()
    }
    
    func updateBadgeNumber() {
        var sharedUserDefaults = NSUserDefaults(suiteName: "group.wissen.ExtensionSharingDefaults")
        badgeNumber = sharedUserDefaults?.integerForKey("BadgeNumber")
        if let badge = badgeNumber {
            if badge > 0 {
                lblMessage.text = "Unread message:"
                lblBadgeCount.text = "\(badge)"
            }
            else {
                lblMessage.text = "No unread message"
                lblBadgeCount.text = ""
            }
        }
        else {
            lblMessage.text = "No unread message"
            lblBadgeCount.text = ""
        }
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        


        completionHandler(NCUpdateResult.NewData)
    }
    
}
