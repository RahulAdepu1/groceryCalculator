//
//  ShoppingListItemModel.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import Foundation

struct ShoppingListNameModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

struct ShoppingListItemModel: Identifiable {
    let id: String = UUID().uuidString
    let ItemName: String
    let ItemBrandName: String
    let ItemCategory: String
    
    let ItemKeptLocation: String
    
    let Cost: Double
    
    /*
     When the item is added as new item it is false.
     When the item is found or not found it is true
     */
    
    let isDone: Bool
    
    /*
     When isDone is true and item is founf then isFound is true and circle is green with tick mark.
     otherwise it is red with cross
     */
    let isFound: Bool
    
    /*
     Ask the user if they want to add all the not found items in a new list
     */
    
    
    enum ShoppingListNameKey: String, CodingKey{
        case id, title
    }
    
    enum ShoppingListItemKey: String, CodingKey{
        case id, ItemName, ItemBrand, ItemCategory, ItemKeptLocation
        case cost
        case isDone, isFound
    }
    
}
