//
//  ListName+CoreDataProperties.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/30/23.
//
//

import Foundation
import CoreData


extension ListName {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListName> {
        return NSFetchRequest<ListName>(entityName: "ListName")
    }

    @NSManaged public var id: String?
    @NSManaged public var listName: String?
    @NSManaged public var date: Date?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension ListName {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: ListItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: ListItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension ListName : Identifiable {

}
