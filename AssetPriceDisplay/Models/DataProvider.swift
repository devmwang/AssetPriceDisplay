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

//// Get functions
//extension DataProvider {
//    private func getWatchlist() -> [AssetModel] {
//        let fetchRequest: NSFetchRequest<AssetModel> = AssetModel.fetchRequest()
//
//        do {
//            // Return an array of AssetModel objects, retrieved from the Core Data store
//            return try persistentContainer.viewContext.fetch(fetchRequest)
//        } catch {
//            print("Watchlist failed to load: \(error.localizedDescription)")
//        }
//
//        // If an error occured, return nothing
//        return []
//    }
//}
//
//// Create functions
//extension DataProvider {
//    // Add asset to watchlist
//    func addWatchlist(ticker: String, type: String) {
//        let asset = AssetModel(context: persistentContainer.viewContext)
//
//        asset.ticker = ticker
//        asset.type = type
//
//        do {
//            // Attempt to persist data to Core Data
//            try persistentContainer.viewContext.save()
//
//            print("Asset saved correctly.")
//
//            // Refresh the watchlist
//            watchlist = getWatchlist()
//        } catch {
//            // Rollback changes to container
//            persistentContainer.viewContext.rollback()
//
//            print("Failed to save asset: \(error.localizedDescription)")
//        }
//    }
//}
//
//// Update functions
//extension DataProvider {
//    // Update asset on watchlist
//    func updateWatchlist() {
//        do {
//            // Alert system that object will change
//            objectWillChange.send()
//
//            // Attempt to persist changes to Core Data
//            try persistentContainer.viewContext.save()
//
//            print("Updated asset.")
//        } catch {
//            // Rollback changes to container
//            persistentContainer.viewContext.rollback()
//
//            print("Failed to update asset: \(error.localizedDescription)")
//        }
//    }
//}
//
//// Delete functions
//extension DataProvider {
//    // Delete asset from watchlist
//    func deleteWatchlist(asset: AssetModel) {
//        // Delete asset from container
//        persistentContainer.viewContext.delete(asset)
//
//        do {
//            // Attempt to persist changes to Core Data
//            try persistentContainer.viewContext.save()
//
//            print("Asset deleted.")
//
//            // Refresh the watchlist
//            watchlist = getWatchlist()
//        } catch {
//            // Rollback changes to container
//            persistentContainer.viewContext.rollback()
//
//            print("Failed to delete asset: \(error.localizedDescription)")
//        }
//    }
//}

// Xcode Preview Compatibility
extension DataProvider {
    static var preview: DataProvider = {
        let controller = DataProvider(inMemory: true)

        // Create 2 example assets on watchlist.
        let asset1 = Asset(context: controller.persistentContainer.viewContext)
        asset1.ticker = "BTC"
        asset1.type = "Crypto"
        
        let asset2 = Asset(context: controller.persistentContainer.viewContext)
        asset2.ticker = "PEP"
        asset2.type = "NASDAQ"

        return controller
    }()
}
