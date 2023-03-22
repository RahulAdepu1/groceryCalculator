//
//  ChartTabBarContainer.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import SwiftUI

struct ChartsTabBarContainerView<Content:View>: View {
    
    @Binding var selectedChartTab: ChartsTabBarItem
    let content: Content
    @State private var tabs: [ChartsTabBarItem] = []
    
    init(selection: Binding<ChartsTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selectedChartTab = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            ChartsTabBarView(tabs: tabs, selectedChartTab: $selectedChartTab, localSelection: selectedChartTab)
        }
        .onPreferenceChange(ChartsTabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct ChartTabBarContainer_Previews: PreviewProvider {
    
    static let tabs:[ChartsTabBarItem] = [.oneMonth, .threeMonth, .sixMonth, .oneYear, .yearToDate, .all]
    
    static var previews: some View {
        ChartsTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
