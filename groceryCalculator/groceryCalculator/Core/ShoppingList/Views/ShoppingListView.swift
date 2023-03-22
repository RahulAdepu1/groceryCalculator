//
//  ShoppingListView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI

struct ShoppingListView: View {
    
    @State var items: [ShoppingListNameModel] = [
        ShoppingListNameModel(title: "ListOne"),
        ShoppingListNameModel(title: "ListTwo"),
        ShoppingListNameModel(title: "ListThree")
    ]
    
//    @State var items: [ShoppingListNameModel] = [
//        ShoppingListNameModel(title: "ListOne"),
//        ShoppingListNameModel(title: "ListTwo"),
//        ShoppingListNameModel(title: "ListThree")
//        ]
    
    var body: some View {
        VStack(){
            //Adding Header
//            CustomHeaderView(titleName: "Title", leftIconName: "line.3.horizontal", rightIconName: "plus").frame(height: 50)
            
            
            //Adding Body to the Page
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing:0) {
                    ForEach(items) { item in
                        ShoppingListRowView(ListName: item)
                    }
                }
            }
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}

