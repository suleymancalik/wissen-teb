//
//  ChannelDetailVC.swift
//  Day3
//
//  Created by Suleyman Calik on 18.10.2014.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ChannelDetailVC: UIViewController {
    
    var channel:Channel!

    override func viewDidLoad() {
        super.viewDidLoad()

        println("selected channel: \(channel.title)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
