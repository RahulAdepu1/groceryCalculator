//
//  HomeView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/18/23.
//

import SwiftUI


struct HomeView: View {
    
    @State private var selectedCustomTab: CustomTabBarItem = .pantry
    
    var body: some View {
        ZStack {
            // Background Layer
            //            Color.theme.backgroundPrimaryColor
            //                .ignoresSafeArea()
            
            // Content Layer
            VStack(spacing:0) {
                HeaderView(leftIconName: "line.3.horizontal", rightIconName: "plus")
                Spacer(minLength: 0)
                CustomTabBarContainerView(selection: $selectedCustomTab) {
                    Color.red
                        .customTabBarItem(tab: .pantry, selection: $selectedCustomTab)
                    Color.white
                        .customTabBarItem(tab: .shopList, selection: $selectedCustomTab)
                    ExpensesView()
                        .frame(width: 200, height: 200)
                        .customTabBarItem(tab: .expenses, selection: $selectedCustomTab)
                    Color.green
                        .customTabBarItem(tab: .history, selection: $selectedCustomTab)
                }
                Spacer(minLength: 0)
            }
            .background(Color.theme.tempColor)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}
