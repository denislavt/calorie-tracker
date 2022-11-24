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

    @NSManaged public var name: String?
    @NSManaged @objc(calories100g) public var calories100g: Int
    @NSManaged public var macroFat: Int
    @NSManaged public var macroCarb: Int
    @NSManaged public var macroProtein: Int

}

extension Food : Identifiable {

}
