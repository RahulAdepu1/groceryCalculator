//
//  ExpensesView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI

struct ExpensesView: View {
    // Simple way to change the color of the Page View
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        TabView {
            ChartsSliptScreenView(chartsTitle: "By Category")
            ChartsSliptScreenView(chartsTitle: "By Store")
            ChartsSliptScreenView(chartsTitle: "Average")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
