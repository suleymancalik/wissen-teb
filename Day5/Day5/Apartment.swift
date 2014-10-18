//
//  Apartment.swift
//  Day5
//
//  Created by Suleyman Calik on 18.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Foundation

class Apartment {

    let number:Int
    weak var tenant:Person?
    
    init(number:Int) {
        self.number = number
//        println("Apartment #\(number) is being initialized...")
    }
    
    deinit {
//        println("Apartment #\(number) is being DEinitialized...")
    }
}











