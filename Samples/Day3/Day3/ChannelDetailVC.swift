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

        trackingSwitch.setOn(channel.isTracking, animated: false)

        distanceSlider.enabled = channel.isTracking
        distanceSlider.minimumValue = TrackingDistance.Minimum.rawValue
        distanceSlider.maximumValue = TrackingDistance.Maximum.rawValue
        distanceSlider.setValue(channel.trackingDistance, animated: false)
        
        lblDistance.text = String(format:"%.0f m",distanceSlider.value)
    }
    
    // MARK: - Actions
    
    @IBAction func actionSwitchChanged(sender: UISwitch) {
        
        distanceSlider.enabled = sender.on
        channel.isTracking = sender.on
    }
    
    
    @IBAction func actionSliderChanged(sender: UISlider) {
        
        lblDistance.text = String(format:"%.0f m",sender.value)
        channel.trackingDistance = sender.value
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
