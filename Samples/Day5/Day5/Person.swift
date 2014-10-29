//
//  Person.swift
//  Day5
//
//  Created by Suleyman Calik on 18.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Foundation

class Person {
    let name:String
    var apartment: Apartment?
    
    init(name:String) {
        self.name = name
        
//        println("\(name) is being initializing...")
    }
    
    deinit {
//        println("\(name) is being DEinitializing...")
    }
}








