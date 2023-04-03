//
//  ListItem+CoreDataProperties.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/30/23.
//
//

import Foundation
import CoreData


extension ListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListItem> {
        return NSFetchRequest<ListItem>(entityName: "ListItem")
    }

    @NSManaged public var id: String?
    @NSManaged public var isFound: Bool
    @NSManaged public var isLooking: Bool
    @NSManaged public var itemName: String?
    @NSManaged public var itemCount: Double
    @NSManaged public var listName: ListName?

    public var unwrappeditemName: String {
        itemName ?? "Unknown name"
    }
    
}

extension ListItem : Identifiable {

}
