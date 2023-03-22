//
//  ChartsView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import SwiftUI

struct ChartsSliptScreenView: View {
    
    let chartsTitle: String
    @State private var tabSelection: ChartsTabBarItem = .oneMonth
    
    var body: some View {
        VStack(spacing:0) {
            Text(chartsTitle)
                .font(.title)
                .fontWeight(.heavy)
                .padding(.bottom,10)
            Text("Consumed Expense")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            ChartsView()
                .frame(width: .infinity, height: 250)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
            Text("Shopping Expense")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 10)
                .padding(.bottom, 5)
            ChartsView()
                .frame(width: .infinity, height: 250)
                .cornerRadius(10)
                .padding(.horizontal, 20)
            Spacer()
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    
    
    static let tabs:[ChartsTabBarItem] = [ .oneMonth, .threeMonth, .sixMonth, .oneYear, .yearToDate, .all]
    
    static var previews: some View {
        ChartsSliptScreenView(chartsTitle: "By Category")
    }
}
