//
//  ShoppingListItemViewModel.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/22/23.
//

import Foundation

class ShoppingListItemViewModel: ObservableObject {
    
    @Published var shoppingListItems: [ShoppingListItemModel] = []
    
    
    init(){
        testingValues()
    }
    
    func testingValues (){
        let newShoppingListItems = [
            ShoppingListItemModel(itemName: "Item 1", itemBrandName: "GV", itemCount: 1, isLooking: false, isFound: false),
            ShoppingListItemModel(itemName: "Item 2", itemBrandName: "GV", itemCount: 1, isLooking: false, isFound: false),
            ShoppingListItemModel(itemName: "Item 3", itemBrandName: "GV", itemCount: 1, isLooking: false, isFound: false),
            ShoppingListItemModel(itemName: "Item 4", itemBrandName: "GV", itemCount: 1, isLooking: false, isFound: false),
            ShoppingListItemModel(itemName: "Item 5", itemBrandName: "GV", itemCount: 1, isLooking: false, isFound: false)
        ]
        shoppingListItems.append(contentsOf: newShoppingListItems)
    }
    
    func deleteItem(indexSets: IndexSet){
        shoppingListItems.remove(atOffsets: indexSets)
    }
    
    func moveItems(from: IndexSet, to: Int){
        shoppingListItems.move(fromOffsets: from, toOffset: to)
    }
    
    func addItems(itemName: String, itemCount: Int = 1){
        let newListItem = ShoppingListItemModel(itemName: itemName, itemBrandName: "", itemCount: itemCount, isLooking: false, isFound: false)
        shoppingListItems.append(newListItem)
    }
    
    func updateIsLooking(shoppingListItem : ShoppingListItemModel){
        if let index = shoppingListItems.firstIndex(where: { $0.id == shoppingListItem.id}){
//            print("\(shoppingListItems[index]) Bool1 Before Update")
            shoppingListItems[index] = shoppingListItem.updateIsLooking()
//            print("\(shoppingListItems[index]) Bool1 After Update")
        }
    }
    
    func updateIsFound(shoppingListItem : ShoppingListItemModel){
        if let index = shoppingListItems.firstIndex(where: { $0.id == shoppingListItem.id}){
//            print("\(shoppingListItems[index]) Bool2 Before Update")
            shoppingListItems[index] = shoppingListItem.updateIsFound()
//            print("\(shoppingListItems[index]) Bool2 After Update")
        }
    }
    
    func updateIsNotFound(shoppingListItem : ShoppingListItemModel){
        
        if let index = shoppingListItems.firstIndex(where: { $0.id == shoppingListItem.id}){
//            print("\(shoppingListItems[index]) Both Before Update")
            shoppingListItems[index] = shoppingListItem.updateIsNotFound()
//            print("\(shoppingListItems[index]) Both After Update")
        }
    }
    
    //List Model
    func moveListItems(from source: IndexSet, to destination: Int) {
        shoppingListItems.move(fromOffsets: source, toOffset: destination)
    }

    func deleteListItems(indexSet: IndexSet) {
        shoppingListItems.remove(atOffsets: indexSet)
    }
    
}
