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
        ZStack {
            Color.clear
            let pantry = listNameCoreDataVM.pantryCoreData
            if pantry.isEmpty {
                ZStack {
                    Color.gray.ignoresSafeArea()
                    Text("Empty")
                }
            }else {
                VStack {
                    ScrollView{
                        ForEach(listNameCoreDataVM.pantryCoreData) { item in
                            Text("Item 1")
                                .frame(maxWidth: .infinity)
                                .background(Color.black.opacity(0.6))
                        }
                        
                    }.padding(.top, 30)
                }
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.4))
            }
        }
        .navigationTitle("Pantry")
        .navigationBarTitleDisplayMode(.inline)
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
