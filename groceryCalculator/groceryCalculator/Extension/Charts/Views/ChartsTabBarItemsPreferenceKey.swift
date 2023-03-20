//
//  ChartsTabBarItemPreferenceKey.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import Foundation
import SwiftUI

struct ChartsTabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [ChartsTabBarItem] = []
    
    static func reduce(value: inout [ChartsTabBarItem], nextValue: () -> [ChartsTabBarItem]) {
        value += nextValue()
    }
}

struct ChartsTabBarItemViewModifer: ViewModifier {
    
    let tab: ChartsTabBarItem
    @Binding var selectedChartTab: ChartsTabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selectedChartTab == tab ? 1.0 : 0.0)
            .preference(key: ChartsTabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func chartTabBarItem(tab: ChartsTabBarItem, selection: Binding<ChartsTabBarItem>) -> some View {
        modifier(ChartsTabBarItemViewModifer(tab: tab, selectedChartTab: selection))
    }
}
