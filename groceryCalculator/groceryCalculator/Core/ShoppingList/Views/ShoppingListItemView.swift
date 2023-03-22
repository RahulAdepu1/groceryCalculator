//
//  ShoppingListItemView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListItemView: View {
    @State private var isSwiped = Array(repeating: false, count: 7)
    
    @State var items: [ShoppingListItemModel] = [
        ShoppingListItemModel(ItemName: "Chicken Breast", ItemBrandName: "Great Value", ItemCategory: "Meat", ItemKeptLocation: "Fridge", Cost: 2.35, isDone: false, isFound: false),
        ShoppingListItemModel(ItemName: "Eggs", ItemBrandName: "Great Value", ItemCategory: "Meat", ItemKeptLocation: "Fridge", Cost: 2.35, isDone: true, isFound: false),
        ShoppingListItemModel(ItemName: "Greek Yogurt", ItemBrandName: "Great Value", ItemCategory: "Meat", ItemKeptLocation: "Fridge", Cost: 2.35, isDone: true, isFound: true)
    ]
    
    var body: some View {
        VStack(){
            //Adding Header
//            CustomHeaderView(titleName: "Title", leftIconName: "line.3.horizontal", rightIconName: "plus")
            
            //Adding Body to the Page
            List{
                ForEach(items) { item in
                    ShoppingListItemRowView(rowItem: item)
                    //Adding gestures
                }
                .listRowSeparator(.hidden, edges: .bottom)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Add") {
                        // Handle add button tap
                    }
                    
                    Button("Edit") {
                        // Handle edit button tap
                    }
                }
            }
        }
    }
}

struct ShoppingListItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        ShoppingListItemView()
    }
}
