//
//  CoreDataViewModel.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/27/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    let containerName: String = "CoreDataModel"
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Error loading Core Data. \(error.localizedDescription)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved sucessfully")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}



class CoreDataViewModel: ObservableObject {
    
    //Reference to core data singelton manager instance
    let manager = CoreDataManager.instance
    @Published var listItemsCoreData: [ListItemEntity] = []
    
    private let entityName = "ListItemEntity"
    
    // Initialize ListItems
    init() {
        getListItems()
    }
    
    // Fetech all the List Items from core data
    func getListItems() {
        let request = NSFetchRequest<ListItemEntity>(entityName: entityName)
        
        // false values are on top and true values are bottom
//        let sortByIsLooking = NSSortDescriptor(keyPath: \ListItemEntity.isLooking, ascending: true)
        
        // false values are on top and true values are bottom
//        let sortByIsFound = NSSortDescriptor(keyPath: \ListItemEntity.isFound, ascending: false)
        
//        request.sortDescriptors = [sortByIsLooking, sortByIsFound]
        
        do {
            listItemsCoreData = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    // Add List Items to ListItemEntity in Core Data
    func addListItems(inputItemName: String, inputItemCount: Double = 1.0) {
        let newListItem = ListItemEntity(context: manager.context)
        newListItem.id = UUID().uuidString
        newListItem.listItemName = inputItemName
        newListItem.listItemBrandName = ""
        newListItem.isFound = false
        newListItem.isLooking = false
        newListItem.listItemCost = 0.0
        newListItem.listItemCount = inputItemCount
        newListItem.listItemWtQty = 0.0
        save()
    }
    
    func deleteListItem(indexSets: IndexSet) {
        guard let index = indexSets.first else { return }
        let listItemsCoreData = listItemsCoreData[index]
        manager.context.delete(listItemsCoreData)
        save()
    }
    
    func moveListItem(from: IndexSet, to: Int) {
//        guard let index = indexSets.first else { return }
//
//        let listItemsCoreData = listItemsCoreData[index]
//        manager.context.delete(listItemsCoreData)
//        save()
    }
    
    func updateListItem(listItemsCoreData: ListItemEntity, listItemName: String, inputItemCount: Double = 1.0) {
        
    }
    
    func updateIsLooking(listItemsCoreData: ListItemEntity){
        listItemsCoreData.isLooking = false
        listItemsCoreData.isFound = false
        save()
    }
    
    func updateIsFound(listItemsCoreData: ListItemEntity){
        listItemsCoreData.isLooking = true
        listItemsCoreData.isFound = true
        save()
    }
    
    func updateIsNotFound(listItemsCoreData: ListItemEntity){
        listItemsCoreData.isLooking = true
        listItemsCoreData.isFound = false
        save()
    }
    
//    func addNewListItems() {
//        let newListItem = ListItemEntity(context: manager.context)
//        newListItem.listItemName = "new item"
//        newListItem.listItemCount = 1.0
//        newListItem.isFound = false
//        newListItem.isLooking = false
//        save()
//    }
    
    func save() {
        manager.save()
        getListItems()
    }
    
}
