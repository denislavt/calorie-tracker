//
//  Food+CoreDataProperties.swift
//  Calories-Tracker
//
//  Created by Denislav Todorov on 24.11.22.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var coloriesPer100Grams: Int32
    @NSManaged public var macroCarb: Int32
    @NSManaged public var macroFat: Int32
    @NSManaged public var macroProtein: Int32
    @NSManaged public var name: String?

}

extension Food : Identifiable {

}
