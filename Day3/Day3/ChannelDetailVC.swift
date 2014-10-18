//
//  ChannelDetailVC.swift
//  Day3
//
//  Created by Suleyman Calik on 18.10.2014.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ChannelDetailVC: UIViewController {
    
    @IBOutlet weak var trackingSwitch: UISwitch!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    
    var channel:Channel!

    override func viewDidLoad() {
        super.viewDidLoad()

        println("selected channel: \(channel.title)")
    }    
    
    // MARK: - Actions
    
    @IBAction func actionSwitchChanged(sender: UISwitch) {
    }
    
    
    @IBAction func actionSliderChanged(sender: UISlider) {
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
