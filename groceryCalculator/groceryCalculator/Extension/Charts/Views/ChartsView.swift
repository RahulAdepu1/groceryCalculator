//
//  TempChartView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import SwiftUI

struct ChartsView: View {
    
    @State private var selection: String = "1M"
    @State private var selectedChartTab: ChartsTabBarItem = .oneMonth
    
    var body: some View {
        ChartsTabBarContainerView(selection: $selectedChartTab) {
            Color.black
                .chartTabBarItem(tab: .oneMonth, selection: $selectedChartTab)
            Color.black
                .chartTabBarItem(tab: .threeMonth, selection: $selectedChartTab)
            Color.black
                .chartTabBarItem(tab: .sixMonth, selection: $selectedChartTab)
            Color.black
                .chartTabBarItem(tab: .oneYear, selection: $selectedChartTab)
            Color.black
                .chartTabBarItem(tab: .yearToDate, selection: $selectedChartTab)
            Color.black
                .chartTabBarItem(tab: .all, selection: $selectedChartTab)
        }
    }
}

struct TempChartView_Previews: PreviewProvider {
    
    static let tabs:[ChartsTabBarItem] = [.oneMonth, .threeMonth, .sixMonth, .oneYear, .yearToDate, .all]
    
    static var previews: some View {
        ChartsView()
    }
}


extension ChartsView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Text("1M")
                }
            Color.blue
                .tabItem {
                    Text("3M")
                }
            Color.green
                .tabItem {
                    Text("6M")
                }
        }
    }
}
