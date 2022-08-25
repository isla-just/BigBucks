//
//  CoreDataManager.swift
//  BigBucks
//
//  Created by Isla Just's Macbook Pro on 2022/08/25.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "SpendModel")
        persistentContainer.loadPersistentStores{description, error in
            
            if let error = error{
                fatalError("Unable to init core data\(error)")
            }
        }
    }
}
