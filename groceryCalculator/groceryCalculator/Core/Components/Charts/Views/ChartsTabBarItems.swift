//
//  ChartTabBarItems.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import Foundation
import SwiftUI

//struct ChartsTabBarItem: Hashable {
//    let item :String
//}

enum ChartsTabBarItem: String, Hashable {
    case oneMonth, threeMonth, sixMonth, oneYear, yearToDate, all
    
    var title: String {
        switch self {
        case .oneMonth: return "1M"
        case .threeMonth: return "3M"
        case .sixMonth: return "6M"
        case .oneYear: return "1Y"
        case .yearToDate: return "YTD"
        case .all: return "ALL"
        }
    }
}
