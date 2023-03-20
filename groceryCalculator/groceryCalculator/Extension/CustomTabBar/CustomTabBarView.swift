//
//  CustomTabBar.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [CustomTabBarItem]
    @Binding var selectedCustomTab: CustomTabBarItem
    @Namespace private var namespace
    @State var localSelection: CustomTabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selectedCustomTab) { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
    
//    @Binding var selectedCustomTab: CustomTabBarItem
//    private var fillImage: String {
//        selectedCustomTab.iconName + ".fill"
//    }
//
//    var body: some View {
//        VStack {
//            HStack{
//                ForEach(CustomTabBarItem.allCases, id: \.title) { tab in
//                    Spacer()
//                    VStack {
//                        Image(systemName: selectedCustomTab == tab ? fillImage : tab.iconName)
//                        Text(tab.title)
//                    }
//                    .font(.footnote)
//                    .scaleEffect(selectedCustomTab == tab ? 1.25 : 1.0)
//                    .foregroundColor(selectedCustomTab == tab ? .red : .gray)
//                    .onTapGesture {
//                        withAnimation(.easeInOut){
//                            selectedCustomTab = tab
//                        }
//                    }
//                    Spacer()
//
//                }
//            }
//            .padding(10)
//        }
//        .frame(width: .infinity, height: 60)
//        .background(.white)
//    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs:[CustomTabBarItem] = [.pantry, .shopList, .expenses, .history]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selectedCustomTab: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}



extension CustomTabBarView {
    private func CustomTabView2(tab :CustomTabBarItem) -> some View {
        VStack{
            Image(systemName: tab.iconName)
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
                CustomTabView2(tab: tab)
                    .onTapGesture {
                        SwitchToTab(tab: tab)
                    }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, 6)
        // Change this color to change to color of the rectangle of the ENTIRE TAB BAR
//        .background(Color.black.opacity(1))
        .background(.thinMaterial)
        .cornerRadius(10)
        // Change this to change the shadow of the rectangle of the ENTIRE TAB BAR
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    private func SwitchToTab(tab: CustomTabBarItem) {
        //        withAnimation(.easeInOut){
        selectedCustomTab = tab
        //        }
        
    }
}
