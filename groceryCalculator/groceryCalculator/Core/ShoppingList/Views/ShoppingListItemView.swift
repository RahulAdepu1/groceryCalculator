//
//  ShoppingListItemView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListItemView: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    
    var stillLookingItems: [Binding<ListItemEntity>] {
        $coreDataVM.listItemsCoreData.filter { !$0.isLooking.wrappedValue && !$0.isFound.wrappedValue }
    }
    var foundItems: [Binding<ListItemEntity>] {
        $coreDataVM.listItemsCoreData.filter { $0.isLooking.wrappedValue && $0.isFound.wrappedValue }
    }
    var notFoundItems: [Binding<ListItemEntity>] {
        $coreDataVM.listItemsCoreData.filter { $0.isLooking.wrappedValue && !$0.isFound.wrappedValue }
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Form {
                Section{
                    if stillLookingItems.isEmpty {
                        Text("Nothing left to look for")
                    }else {
                        ForEach(stillLookingItems) { $item in
                            ShoppingListItemRowView(listItemsCoreData: $item)
                                .listRowBackground(Color.theme.backgroundPrimaryColor)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: coreDataVM.deleteListItem)
                    }
                } header: {
                    Text("Still Looking")
                }
                
                Section{
                    if foundItems.isEmpty {
                        Text("Did not find anything yet?")
                    }else {
                        ForEach(foundItems) { $item in
                            ShoppingListItemRowView(listItemsCoreData: $item)
                                .listRowBackground(Color.theme.backgroundPrimaryColor)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: coreDataVM.deleteListItem)
                    }
                } header: {
                    Text("Items Found")
                }
                
                Section {
                    if notFoundItems.isEmpty {
                        Text("All Items are available!!!")
                    }else {
                        ForEach(notFoundItems) { $item in
                            ShoppingListItemRowView(listItemsCoreData: $item)
                                .listRowBackground(Color.theme.backgroundPrimaryColor)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: coreDataVM.deleteListItem)
                    }
                } header: {
                    Text("Items Not Found")
                }
            }
//            Style of the list
            .listStyle(.plain)
            
            /*
             FEATURE
             
             Ask user if they want to add all the "Not Found Items" in a new list
             */
            
            
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
        .environmentObject(CoreDataViewModel())
    }
}

