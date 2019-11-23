//
//  Big+CoreDataProperties.swift
//  Blogger
//
//  Created by Frank Bara on 11/22/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//
//

import Foundation
import CoreData


extension Big {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Big> {
        return NSFetchRequest<Big>(entityName: "Big")
    }

    @NSManaged public var name: String?
    @NSManaged public var carrier: String?
    @NSManaged public var saved: Bool

}
