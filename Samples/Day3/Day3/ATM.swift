//
//  ATM.swift
//  Day3
//
//  Created by Suleyman Calik on 11/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import Foundation

class ATM:Channel {

    convenience init(title:String) {
        self.init()
        self.title = title
    }
}