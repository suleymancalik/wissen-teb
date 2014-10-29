//
//  User.swift
//  Day6
//
//  Created by Suleyman Calik on 19.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var password: String
    @NSManaged var username: String
    @NSManaged var facebookId: String
    @NSManaged var cards: NSSet

}
