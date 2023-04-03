//
//  History+CoreDataProperties.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 4/2/23.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemBrand: String?
    @NSManaged public var id: String?
    @NSManaged public var stockedDate: Date?
    @NSManaged public var consumedDate: Date?
    @NSManaged public var expiryDate: Date?
    @NSManaged public var category: String?
    @NSManaged public var location: String?
    @NSManaged public var cost: Double
    @NSManaged public var count: Double
    @NSManaged public var consumedAmount: Double
    @NSManaged public var remainingAmount: Double

}

extension History : Identifiable {

}
