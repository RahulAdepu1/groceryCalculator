//
//  ShoppingListItemModel.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/22/23.
//

import Foundation

struct ShoppingListItemModel: Identifiable {
    let id: String
    let itemName: String
    let itemBrandName: String
    let itemCount: Int
    var isLooking: Bool
    var isFound: Bool
    
    init(id: String = UUID().uuidString, itemName: String, itemBrandName: String, itemCount: Int, isLooking: Bool, isFound: Bool) {
        self.id = id
        self.itemName = itemName
        self.itemBrandName = itemBrandName
        self.itemCount = itemCount
        self.isLooking = isLooking
        self.isFound = isFound
    }
    
//    func updateItemName(newItemName: String) -> ShoppingListItemModel{
//        return ShoppingListItemModel(id: id, itemName: newItemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: isLooking, isFound: isFound)
//    }
    
//    func updateItemBrandName(newItemBrandName: String) -> ShoppingListItemModel{
//        return ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: newItemBrandName, itemCount: itemCount, isLooking: isLooking, isFound: isFound)
//    }
    
    func updateIsLooking() -> ShoppingListItemModel{
//        print("\(ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: isLooking, isFound: isFound))) Bool1 in Model")
        return ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: false, isFound: false)
    }

    func updateIsFound() -> ShoppingListItemModel{
//        print("\(ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: isLooking, isFound: isFound)) Bool2 in Model")
        return ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: true, isFound: true)
    }
    func updateIsNotFound() -> ShoppingListItemModel{
//        print("\(ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: isLooking, isFound: isFound)) Booth Bools in Model")
        return ShoppingListItemModel(id: id, itemName: itemName, itemBrandName: itemBrandName, itemCount: itemCount, isLooking: true, isFound: false)
    }
    
}
