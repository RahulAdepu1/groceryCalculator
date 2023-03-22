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
            Color.theme.backgroundPrimaryColor
                .ignoresSafeArea()

            // Content Layer
            VStack(spacing:0) {

                // Custom Header View
//                CustomHeaderView(titleName: "Title", leftIconName: "line.3.horizontal", rightIconName: "plus")
//                Divider()
//                Spacer()

//                // Custom Tab Bar with its respective Content View
                CustomTabBarContainerView(selection: $selectedCustomTab) {
                    PantryView()
                        .customTabBarItem(tab: .pantry, selection: $selectedCustomTab)
                    ShoppingListView()
                        .customTabBarItem(tab: .shopList, selection: $selectedCustomTab)
                    ExpensesView()
                        .customTabBarItem(tab: .expenses, selection: $selectedCustomTab)
                    HistoryView()
                        .customTabBarItem(tab: .history, selection: $selectedCustomTab)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
                .toolbar(.hidden)
        }
    }
}
