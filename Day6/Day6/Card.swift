//
//  Card.swift
//  Day6
//
//  Created by Suleyman Calik on 19.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Foundation
import CoreData

class Card: NSManagedObject {

    @NSManaged var cardId: String
    @NSManaged var user: User

}
