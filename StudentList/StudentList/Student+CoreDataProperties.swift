//
//  Student+CoreDataProperties.swift
//  StudentList
//
//  Created by Julia on 2017/10/25.
//  Copyright © 2017 Julia. All rights reserved.
//
//

import Foundation
import CoreData

extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    // Edit only when adding new attributes in this Student entity
    @NSManaged public var name: String?
}
