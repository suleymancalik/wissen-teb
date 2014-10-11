//
//  Branch.swift
//  Day3
//
//  Created by Suleyman Calik on 11/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import Foundation

class Branch {
    
    var title:String = ""
    var phoneNumber:String = ""
    
    convenience init(title:String , phoneNumber:String) {
        self.init()
        self.title = title
        self.phoneNumber = phoneNumber
    }
}