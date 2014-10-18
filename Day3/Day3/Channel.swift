//
//  Channel.swift
//  Day3
//
//  Created by Suleyman Calik on 12/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import Foundation

class Channel {
    
    var title:String = ""
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var isTracking:Bool = false
    var trackingDistance:Float = 100 {
        didSet {
            if trackingDistance < 100 {
                trackingDistance = 100
            }
            else if trackingDistance > 1000 {
                trackingDistance = 1000
            }
        }
    }
}







