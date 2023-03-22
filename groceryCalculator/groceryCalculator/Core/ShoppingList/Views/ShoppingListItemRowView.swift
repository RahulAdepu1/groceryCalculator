//
//  ShoppingListItemRowView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListItemRowView: View {
    
    let rowItem: ShoppingListItemModel
    
    var body: some View {
        HStack{
            
            // format {Condition ? true : false}
            Image(systemName: rowItem.isDone ? (rowItem.isFound ? "checkmark.circle" : "multiply.circle") : "circle")
                .foregroundColor(rowItem.isDone ? (rowItem.isFound ? Color.green : Color.red) : Color.black)
            Text(rowItem.ItemName)
                .font(.body)
                .foregroundColor(Color.theme.textPrimaryColor.opacity(1))
            Spacer()
//            Text(rowItem.Cost)
        }
        .padding(10)
        .background(Color.theme.backgroundSecondaryColor)
        .cornerRadius(10)
        .padding(.horizontal, 10)
    }
}

struct ShoppingListItemRowView_Previews: PreviewProvider {
    
    static var item1 = ShoppingListItemModel(ItemName: "Chicken Breast", ItemBrandName: "Great Value", ItemCategory: "Meat", ItemKeptLocation: "Fridge", Cost: 2.35, isDone: false, isFound: false)
    static var item2 = ShoppingListItemModel(ItemName: "Eggs", ItemBrandName: "Great Value", ItemCategory: "Meat", ItemKeptLocation: "Fridge", Cost: 2.35, isDone: true, isFound: false)
    static var item3 = ShoppingListItemModel(ItemName: "Greek Yogurt", ItemBrandName: "Great Value", ItemCategory: "Meat", ItemKeptLocation: "Fridge", Cost: 2.35, isDone: true, isFound: true)
    
    static var previews: some View {
        VStack{
            ShoppingListItemRowView(rowItem: item1)
            ShoppingListItemRowView(rowItem: item2)
            ShoppingListItemRowView(rowItem: item3)
        }
    }
}
