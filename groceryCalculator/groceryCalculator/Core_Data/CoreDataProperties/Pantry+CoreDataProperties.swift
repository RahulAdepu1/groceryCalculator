//
//  Pantry+CoreDataProperties.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/31/23.
//
//

import Foundation
import CoreData


extension Pantry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pantry> {
        return NSFetchRequest<Pantry>(entityName: "Pantry")
    }

    @NSManaged public var id: String?
    @NSManaged public var stockedDate: Date?
    @NSManaged public var expiryDate: Date?
    @NSManaged public var consumedDate: Date?
    @NSManaged public var count: NSDecimalNumber?
    @NSManaged public var itemName: String?
    @NSManaged public var itemBrand: String?
    @NSManaged public var category: String?
    @NSManaged public var cost: Double
    @NSManaged public var location: String?

}

extension Pantry : Identifiable {

}
