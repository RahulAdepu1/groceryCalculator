//
//  CoreDataManager.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/30/23.
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

//MARK: - List Name Core Data View Model
class ListNameCoreDataVM: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    let listNameEntity: String = "ListName"
    let listItemEntity: String = "ListItem"
    let pantryEntity: String = "Pantry"
    @Published var listNameCoreData: [ListName] = []
    @Published var listItemsCoreData: [ListItem] = []
    @Published var pantryCoreData: [Pantry] = []
    
    @Published var stillLookingItemsArray: [ListItem] = []
    @Published var foundItemsArray: [ListItem] = []
    @Published var notFoundItemsArray: [ListItem] = []
    
    // Initialize ListItems
    init() {
        whereIsMySQLite()
        fetchListName()
        fetchListItems()
        fetchPantry()
        
        stillLookingItems()
        foundItems()
        notFoundItems()
    }
    
    //Find Database Location
    func whereIsMySQLite() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        print(path ?? "Not found")
    }
    
//------------------------------------------------------------------------------------------------------------------------
    // Fetech all the List Items from core data
    func fetchListName() {
        let request = NSFetchRequest<ListName>(entityName: listNameEntity)
        do {
            listNameCoreData = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func fetchListItems() {
        let request = NSFetchRequest<ListItem>(entityName: listItemEntity)
        do {
            listItemsCoreData = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func fetchPantry() {
        let request = NSFetchRequest<Pantry>(entityName: pantryEntity)
        do {
            pantryCoreData = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
//------------------------------------------------------------------------------------------------------------------------
    // Add List Name
    func addListName(inputListName: String) {
        let newListName = ListName(context: manager.context)
        newListName.id = UUID().uuidString
        newListName.date = Date()
        newListName.listName = inputListName
        save()
    }
    
    // Add List Item
    func addListItem(inputListItem: String, listName: ListName) {
        let newListItem = ListItem(context: manager.context)
        newListItem.id = UUID().uuidString
        newListItem.itemName = inputListItem
        newListItem.itemCount = 1.0
        newListItem.isLooking = false
        newListItem.isFound = false
        listName.addToItems(newListItem)
        save()
    }
    
    func addPantry(itemName: String, itemCount: Double) {
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.id = UUID().uuidString
        newPantryItems.itemName = itemName
        newPantryItems.itemBrand = ""
        newPantryItems.category = ""
        newPantryItems.location = ""
        newPantryItems.count = itemCount
        newPantryItems.cost = 0.0
        newPantryItems.stockedDate = Date()
        newPantryItems.expiryDate = Date()
        newPantryItems.consumedDate = Date()
        save()
    }
//------------------------------------------------------------------------------------------------------------------------
    // Delete List Name
    func deleteListName(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let listNameCoreData = listNameCoreData[index]
        manager.context.delete(listNameCoreData)
        save()
    }
    
    // Delete List Item
    func deleteListItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let listItemsCoreData = listItemsCoreData[index]
        manager.context.delete(listItemsCoreData)
        save()
    }
    
//------------------------------------------------------------------------------------------------------------------------
    func stillLookingItems() -> [ListItem]{
        return listNameCoreData.flatMap{ $0.itemsArray.filter{ !$0.isLooking && !$0.isFound } }
    }
    
    func foundItems(){
        fetchListName()
        foundItemsArray = listNameCoreData.flatMap{ $0.itemsArray.filter{ $0.isLooking && $0.isFound } }
    }
    
    func notFoundItems(){
        notFoundItemsArray = listNameCoreData.flatMap{ $0.itemsArray.filter{ $0.isLooking && !$0.isFound } }
    }
//------------------------------------------------------------------------------------------------------------------------
    // Updating Boolen Conditions
    func updateIsLooking(listItemsCoreData: ListItem){
        listItemsCoreData.isLooking = false
        listItemsCoreData.isFound = false
        save()
    }
    
    func updateIsFound(listItemsCoreData: ListItem){
        listItemsCoreData.isLooking = true
        listItemsCoreData.isFound = true
        save()
    }
    
    func updateIsNotFound(listItemsCoreData: ListItem){
        listItemsCoreData.isLooking = true
        listItemsCoreData.isFound = false
        save()
    }
    
//------------------------------------------------------------------------------------------------------------------------
    // Updating Data of Items Pantry
    func updatePantryItemName(pantryItemName: String){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.itemName = pantryItemName
    }
    
    func updatePantryItemBrand(pantryItemBrand: String){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.itemBrand = pantryItemBrand
    }
    
    func updatePantryCategory(pantryCategory: String){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.category = pantryCategory
    }
    
    func updatePantryLocation(pantryLocation: String){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.location = pantryLocation
    }
    
    func updatePantryItemCount(pantryItemCount: Double){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.count = pantryItemCount
    }
    
    func updatePantryItemCost(pantryItemCost: Double){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.cost = pantryItemCost
    }
    
    func updatePantryStockedDate(pantryStockedDate: Date){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.stockedDate = pantryStockedDate
    }
    
    func updatePantryExpiryDate(pantryExpiryDate: Date){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.expiryDate = pantryExpiryDate
    }
    
    func updatePantryConsumenDate(pantryConsumenDate: Date){
        let newPantryItems = Pantry(context: manager.context)
        newPantryItems.consumedDate = pantryConsumenDate
    }
    
//------------------------------------------------------------------------------------------------------------------------
    func save() {
        manager.save()
        fetchListName()
        fetchListItems()
        fetchPantry()
    }
    
}




////MARK: - List Item Core Data View Model
//class ListItemCoreDataVM: ObservableObject {
//
//    let manager = CoreDataManager.instance
//
//    let listItemEntity: String = "ListItem"
//    @Published var listItemsCoreData: [ListItem] = []
//
//    // Initialize ListItems
//    init() {
//        fetchListItems()
//    }
//
//    // Fetech all the List Items from core data
//    func fetchListItems() {
//        let requestListItems = NSFetchRequest<ListItem>(entityName: listItemEntity)
//        do {
//            listItemsCoreData = try manager.context.fetch(requestListItems)
//        }catch let error {
//            print("Error fetching. \(error.localizedDescription)")
//        }
//    }
//
////    func addListItem(inputListItem: String, listName: ListName) {
////        let newListItem = ListItem(context: manager.context)
////        newListItem.id = UUID().uuidString
////        newListItem.itemName = inputListItem
////        newListItem.itemCount = 1.0
////        newListItem.isLooking = false
////        newListItem.isFound = false
////        listName.addToItems(newListItem)
////        save()
////    }
//
//    func deleteListItem(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let listItemsCoreData = listItemsCoreData[index]
//        manager.context.delete(listItemsCoreData)
//        save()
//    }
//
//    func updateListItem(listItemsCoreData: ListItem, listItemName: String, inputItemCount: Double = 1.0) {
//
//    }
//
//    func updateIsLooking(listItemsCoreData: ListItem){
//        listItemsCoreData.isLooking = false
//        listItemsCoreData.isFound = false
//        save()
//    }
//
//    func updateIsFound(listItemsCoreData: ListItem){
//        listItemsCoreData.isLooking = true
//        listItemsCoreData.isFound = true
//        save()
//    }
//
//    func updateIsNotFound(listItemsCoreData: ListItem){
//        listItemsCoreData.isLooking = true
//        listItemsCoreData.isFound = false
//        save()
//    }
//
//    func save() {
//        manager.save()
//        fetchListItems()
//    }
//
//}
