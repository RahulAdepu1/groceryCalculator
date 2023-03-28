//
//  CoreDataViewModel.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/27/23.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    //Reference to core data singelton manager instance
    let manager = CoreDataManager.instance
    @Published var listItemsCoreData: [ListItemEntity] = []
    
    // Initialize ListItems
    init() {
        getListItems()
    }
    
    // Fetech all the List Items from core data
    func getListItems() {
        let request = NSFetchRequest<ListItemEntity>(entityName: "ListItemEntity")
        do {
            listItemsCoreData = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
        
    }
    
    // Add List Items to ListItemEntity in Core Data
    func addListItems(inputItemName: String, inputItemBrandName: String = "") {
        let newListItem = ListItemEntity(context: manager.context)
        newListItem.listItemName = inputItemName
        newListItem.listItemBrandName = inputItemBrandName
    }
    
    func save(){
        manager.save()
    }
}
