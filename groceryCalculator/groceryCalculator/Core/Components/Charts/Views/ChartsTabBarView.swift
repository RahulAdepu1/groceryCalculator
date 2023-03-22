//
//  ChartsTabBarView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import SwiftUI

struct ChartsTabBarView: View {
    
    let tabs: [ChartsTabBarItem]
    @Binding var selectedChartTab: ChartsTabBarItem
    @Namespace private var namespace
    @State var localSelection: ChartsTabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selectedChartTab) { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
}


struct ChartsTabBarView_Previews: PreviewProvider {
    
    static let tabs:[ChartsTabBarItem] = [.oneMonth, .threeMonth, .sixMonth, .oneYear, .yearToDate, .all]
    
    static var previews: some View {
        VStack {
            Spacer()
            ChartsTabBarView(tabs: tabs, selectedChartTab: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension ChartsTabBarView {
    private func ChartTabView(tab :ChartsTabBarItem) -> some View {
        VStack{
            Text(tab.title)
                .font(.footnote)
        }
        .foregroundColor(self.localSelection == tab ? .black : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(self.localSelection == tab ? Color.gray.opacity(0.8): Color.clear)
        .cornerRadius(12)
    }

    private var tabBarVersion1: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                ChartTabView(tab: tab)
                    .onTapGesture {
                        SwitchToTab(tab: tab)
                    }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, 6)
        .background(Color.black)
    }

    private func SwitchToTab(tab: ChartsTabBarItem) {
        //        withAnimation(.easeInOut){
        selectedChartTab = tab
        //        }

    }
}


extension ChartsTabBarView {
    private func ChartTabView2(tab :ChartsTabBarItem) -> some View {
        VStack{
            Text(tab.title)
                .font(.footnote)
        }
        .foregroundColor(self.localSelection == tab ? .black : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 12)
                    // Change this to change the color of the rectangle of the ITEM of tab bar
                        .fill(Color.orange.opacity(0.8))
                    // Change this to change the shadow of the rectangle of the ITEM of tab bar
                        .shadow(color: Color.orange.opacity(0.3), radius: 10, x: 0, y: 5)
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                ChartTabView2(tab: tab)
                    .onTapGesture {
                        SwitchToTab(tab: tab)
                    }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, 6)
        // Change this color to change to color of the rectangle of the ENTIRE TAB BAR
        .background(Color.black.opacity(1))
        .cornerRadius(10)
        // Change this to change the shadow of the rectangle of the ENTIRE TAB BAR
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}
