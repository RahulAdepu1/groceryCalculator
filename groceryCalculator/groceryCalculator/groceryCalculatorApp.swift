//
//  groceryCalculatorApp.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/15/23.
//

import SwiftUI

@main
struct groceryCalculatorApp: App {
    
    @StateObject var coreDataViewModel: CoreDataViewModel = CoreDataViewModel()
    
    @StateObject var shoppingListItem: ShoppingListItemViewModel = ShoppingListItemViewModel()
    @StateObject var shoppingListName: ShoppingListNameViewModel = ShoppingListNameViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ShoppingListItemView()
//                    .toolbar(.hidden)
            }
            .environmentObject(shoppingListItem)
            .environmentObject(shoppingListName)
            .environmentObject(coreDataViewModel)
        }
    }
}
