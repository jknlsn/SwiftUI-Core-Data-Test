//
//  CoreData.swift
//  SwiftUI Core Data Test
//
//  Created by Chuck Hartman on 6/25/19.
//  Copyright © 2019 ForeTheGreen. All rights reserved.
//

import CoreData

class CoreData: NSObject {
    
    static let stack = CoreData()   // Singleton

    // MARK: - Core Data stack
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SwiftUI_Core_Data_Test")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let nserror = error as NSError? {
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        })
        return container
    }()
    
    public var context: NSManagedObjectContext {
        
        get {
            return self.persistentContainer.viewContext
        }
    }
    
    // MARK: - Core Data Saving support
    
    public func save() {

        if self.context.hasChanges {
            do {
                try self.context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Database setup
    
    public class func initialDbSetup() -> Void {
        
        if Entity.count() == 0 {
            for i in 0...4 {
                Entity.createEntity(name: "Item \(i)",order: i)
            }
        }
    }
    
    // MARK: - Managed Object Helpers
    
    class func executeBlockAndCommit(_ block: @escaping () -> Void) {
        
        block()
        CoreData.stack.save()
    }
    
}
