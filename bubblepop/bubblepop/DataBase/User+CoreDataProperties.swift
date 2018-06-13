//
//  User+CoreDataProperties.swift
//  bubblepop
//
//  Created by Spring on 2018/5/10.
//  Copyright © 2018年 UTS. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var score: Int16

}
