//
//  ShoppingListRowView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListRowView: View {
    
    let ListName: ShoppingListNameModel
    
    var body: some View {
        HStack{
            Text(ListName.title)
                .font(.body)
                .foregroundColor(Color.theme.textPrimaryColor.opacity(0.8))
            Spacer()
        }
        .padding(10)
        .padding(.vertical, 5)
        .background(Color.theme.backgroundSecondaryColor)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.vertical, 2)
    }
}

struct ShoppingListRowView_Previews: PreviewProvider {
    
    static var listName1 = ShoppingListNameModel(title: "List One")
    static var listName2 = ShoppingListNameModel(title: "List Two")
    
    static var previews: some View {
        VStack{
            ShoppingListRowView(ListName: listName1)
            ShoppingListRowView(ListName: listName2)
        }
//        .previewLayout(.sizeThatFits)
    }
}
