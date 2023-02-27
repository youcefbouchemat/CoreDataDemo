//
//  Persistence.swift
//  CoreDataDemo
//
//  Created by apple on 27/2/2023.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController();
    
    let container : NSPersistentContainer;
    
    init() {
        container = NSPersistentContainer(name: "Products");
        
        container.loadPersistentStores{(storeDescription,error) in
            if let error = error as NSError?{
                fatalError("Container load failed: \(error)")
            }
        }

    }

}
