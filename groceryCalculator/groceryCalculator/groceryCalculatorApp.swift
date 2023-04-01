//
//  groceryCalculatorApp.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/15/23.
//

import SwiftUI

@main
struct groceryCalculatorApp: App {
    
    @StateObject var listNameCoreDataVM: ListNameCoreDataVM = ListNameCoreDataVM()
//    @StateObject var listItemCoreDataVM: ListItemCoreDataVM = ListItemCoreDataVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ShoppingListView()
            }
            .environmentObject(listNameCoreDataVM)
//            .environmentObject(listItemCoreDataVM)
        }
    }
}
