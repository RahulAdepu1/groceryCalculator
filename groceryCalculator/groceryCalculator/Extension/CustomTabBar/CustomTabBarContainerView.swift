//
//  CustomTabBarContainerView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    
    @Binding var selectedCustomTab: CustomTabBarItem
    let content: Content
    @State private var tabs: [CustomTabBarItem] = []
    
    init(selection: Binding<CustomTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selectedCustomTab = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selectedCustomTab: $selectedCustomTab, localSelection: selectedCustomTab)
        }
        .onPreferenceChange(CustomTabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs:[CustomTabBarItem] = [.pantry, .shopList, .expenses, .history]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
