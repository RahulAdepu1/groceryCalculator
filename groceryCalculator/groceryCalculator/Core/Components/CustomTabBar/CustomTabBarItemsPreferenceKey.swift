//
//  CustomTabBarItemsPreferenceKey.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI

struct CustomTabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [CustomTabBarItem] = []
    
    static func reduce(value: inout [CustomTabBarItem], nextValue: () -> [CustomTabBarItem]) {
        value += nextValue()
    }
}

struct CustomTabBarItemViewModifer: ViewModifier {
    
    let tab: CustomTabBarItem
    @Binding var selectedCustomTab: CustomTabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selectedCustomTab == tab ? 1.0 : 0.0)
            .preference(key: CustomTabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func customTabBarItem(tab: CustomTabBarItem, selection: Binding<CustomTabBarItem>) -> some View {
        modifier(CustomTabBarItemViewModifer(tab: tab, selectedCustomTab: selection))
    }
}
