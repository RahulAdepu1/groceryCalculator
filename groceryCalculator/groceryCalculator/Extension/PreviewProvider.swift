//
//  PreviewProvider.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/26/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let shoppingListItem = ShoppingListItemModel(
        id: "1234567890",
        itemName: "Chicken",
        itemBrandName: "GV",
        itemCount: 1,
        isLooking: false,
        isFound: false)
}
