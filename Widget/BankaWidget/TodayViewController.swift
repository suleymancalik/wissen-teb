//
//  TodayViewController.swift
//  BankaWidget
//
//  Created by Suleyman Calik on 26.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTodayText()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("updateTodayText"), name: NSUserDefaultsDidChangeNotification, object: nil)
        
        preferredContentSize =
            CGSize(width: UIScreen.mainScreen().bounds.width, height: 120)
    }

    @IBAction func actionTest(sender: UIButton) {

        var url = NSURL(string: "banka:")
        self.extensionContext?.openURL(url!, completionHandler: nil)
    }
    
    
    func updateTodayText() {
        var newText = NSUserDefaults(suiteName:"group.wissen.TodayDefaults")?.stringForKey("text")
        if let text = newText {
            lblTitle.text = text
        }
        else {
            lblTitle.text = "Giris Yap"
        }
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        updateTodayText()
        completionHandler(NCUpdateResult.NewData)
    }
    
}
