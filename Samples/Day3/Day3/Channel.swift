//
//  Channel.swift
//  Day3
//
//  Created by Suleyman Calik on 12/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import Foundation

enum TrackingDistance:Float {
    case Minimum = 2000
    case Maximum = 100000
}

//let minTrackingDistance:Float = 200
//let maxTrackingDistance:Float = 1000


class Channel {
    
    var title:String = ""
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var isTracking:Bool = false
    var trackingDistance:Float = TrackingDistance.Minimum.rawValue {
        didSet {
            if trackingDistance < TrackingDistance.Minimum.rawValue {
                trackingDistance = TrackingDistance.Minimum.rawValue
            }
            else if trackingDistance > TrackingDistance.Maximum.rawValue {
                trackingDistance = TrackingDistance.Maximum.rawValue
            }
        }
    }
}







