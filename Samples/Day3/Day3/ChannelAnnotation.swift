//
//  ChannelAnnotation.swift
//  Day3
//
//  Created by Suleyman Calik on 12/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import Foundation
import MapKit


class ChannelAnnotation: NSObject ,  MKAnnotation {
    
    var coordinate:CLLocationCoordinate2D {
        return channel.coordinate
    }
    
    var title:String {
        return channel.title
    }
    
    var subtitle: String {
        if channel is Branch {
            var branch = channel as Branch
            return branch.phoneNumber
        }
        else {
            return ""
            }
    }
    
    var channel:Channel!
}








