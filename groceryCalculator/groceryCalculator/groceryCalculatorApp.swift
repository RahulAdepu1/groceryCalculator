//
//  groceryCalculatorApp.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/15/23.
//

import SwiftUI

@main
struct groceryCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}
