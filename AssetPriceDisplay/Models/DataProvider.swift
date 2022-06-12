//
//  DataProvider.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-09.
//

import Foundation
import CoreData

struct DataProvider {
    static let DataProviderInstance = DataProvider()
    
    let persistentContainer: NSPersistentContainer
    
    // Initialize container connection to Core Data store
    init(inMemory: Bool = false) {
        // Set Core Data container
        persistentContainer = NSPersistentContainer(name: "AssetPriceDisplay")
        
        // If inMemory is true, do not persist changes to Core Data store
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func persistAllChanges() {
        let containerViewContext = persistentContainer.viewContext

        if containerViewContext.hasChanges {
            do {
                try containerViewContext.save()
            } catch {
                print("Failed to persist changes to Core Data store: \(error.localizedDescription)")
            }
        }
    }
}

// Xcode Preview Compatibility
extension DataProvider {
    static var preview: DataProvider = {
        let controller = DataProvider(inMemory: true)

        // Create 2 example assets on watchlist.
        let asset1 = Asset(context: controller.persistentContainer.viewContext)
        asset1.ticker = "BTC"
        asset1.type = "Crypto"
        asset1.price = 28490.00
        
        let asset2 = Asset(context: controller.persistentContainer.viewContext)
        asset2.ticker = "PEP"
        asset2.type = "NASDAQ"
        asset2.price = 162.52

        return controller
    }()
}
