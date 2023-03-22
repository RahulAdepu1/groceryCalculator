//
//  CustomTabBarItems.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI


enum CustomTabBarItem: Hashable, CaseIterable {
    case pantry, shopList, expenses, history
    
    var iconName: String {
        switch self {
        case .pantry: return "cabinet"
        case .shopList: return "cart.circle"
        case .expenses: return "dollarsign.circle"
        case .history: return "clock"
        }
    }
    
    var title: String {
        switch self {
        case .pantry: return "Pantry"
        case .shopList: return "Shop List"
        case .expenses: return "Expenses"
        case .history: return "History"
        }
    }
}

