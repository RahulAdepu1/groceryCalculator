//
//  CoreDataManager.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/27/23.
//

//import Foundation
//import CoreData
//
//class CoreDataManager {
//    static let instance = CoreDataManager()
//    
//    private let container: NSPersistentContainer
//    private let containerName: String = "CoreDataModel"
//    let context: NSManagedObjectContext
//    
//    
//    init() {
//        container = NSPersistentContainer(name: containerName)
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("Error loading Core Data. \(error)")
//            }
//        }
//        context = container.viewContext
//    }
//    
//    func save() {
//        do {
//            try context.save()
//            print("Save Successfully")
//        }catch let error {
//            print("Error ssaving Core Data. \(error.localizedDescription)")
//        }
//        
//    }
//    
//}
