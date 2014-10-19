//
//  User.swift
//  Day6
//
//  Created by Suleyman Calik on 19.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Foundation
import CoreData

//@objc(User)
class User: NSManagedObject {

    @NSManaged var username: String
    @NSManaged var password: String

}
