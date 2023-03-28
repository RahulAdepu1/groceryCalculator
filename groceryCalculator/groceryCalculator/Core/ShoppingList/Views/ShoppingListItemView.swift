//
//  ShoppingListItemView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListItemView: View {
    
    @EnvironmentObject var shoppingListItemVM: ShoppingListItemViewModel
    
    var stillLookingItems: [Binding<ShoppingListItemModel>] {
        $shoppingListItemVM.shoppingListItems.filter { !$0.isLooking.wrappedValue && !$0.isFound.wrappedValue }
    }
    var foundItems: [Binding<ShoppingListItemModel>] {
        $shoppingListItemVM.shoppingListItems.filter { $0.isLooking.wrappedValue && $0.isFound.wrappedValue }
    }
    var notFoundItems: [Binding<ShoppingListItemModel>] {
        $shoppingListItemVM.shoppingListItems.filter { $0.isLooking.wrappedValue && !$0.isFound.wrappedValue }
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            //List of items in the Shopping List Name
            List {
                let stillLookingItems = stillLookingItems
                ForEach(stillLookingItems) { $item in
                    ShoppingListItemRowView( shoppingListItem: item)
                        .listRowBackground(Color.theme.backgroundPrimaryColor)
                        .listRowSeparator(.hidden)
                        
                }
                .onMove(perform: shoppingListItemVM.moveListItems)
                .onDelete(perform: shoppingListItemVM.deleteListItems)
                
                let foundItems = foundItems
                ForEach(foundItems) { $item in
                    ShoppingListItemRowView( shoppingListItem: item)
                }
                .onMove(perform: shoppingListItemVM.moveListItems)
                .onDelete(perform: shoppingListItemVM.deleteListItems)
                
                let notFoundItems = notFoundItems
                ForEach(notFoundItems) { $item in
                    ShoppingListItemRowView( shoppingListItem: item)
                }
                .onMove(perform: shoppingListItemVM.moveListItems)
                .onDelete(perform: shoppingListItemVM.deleteListItems)
            }
            //Style of the list
            .listStyle(.plain)
            
            
            // Button to navigate to a view to add new items to the list
            NavigationLink {
                // Reference to View
                ShoppingListItemAddView()
            } label: {
                // Look of the Button
                CustomAddButtonView()
            }
            .padding(50)

        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
    
}
//MARK: - Preview

struct ShoppingListItemView_Previews: PreviewProvider {
    
    static var previews: some View {    
        NavigationStack {
            ShoppingListItemView()
        }
        .environmentObject(ShoppingListItemViewModel())
        .environmentObject(ShoppingListNameViewModel())
    }
}

