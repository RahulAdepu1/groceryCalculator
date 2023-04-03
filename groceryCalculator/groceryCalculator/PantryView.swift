//
//  PantryView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/31/23.
//

import SwiftUI

struct PantryView: View {
    
    @EnvironmentObject var listNameCoreDataVM: ListNameCoreDataVM
    
    var body: some View {
        Text("Hello")
    }
}


//MARK: - Preview Section

struct PantryView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack{
            PantryView()
        }
        .environmentObject(ListNameCoreDataVM())
    }
}
