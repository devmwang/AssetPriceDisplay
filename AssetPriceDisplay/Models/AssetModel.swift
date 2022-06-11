//
//  AssetModel.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-09.
//

import Foundation
import CoreData

public class AssetModel: NSManagedObject, Identifiable {
    public class func fetchRequest() -> NSFetchRequest<AssetModel> {
        return NSFetchRequest<AssetModel>(entityName: "Asset")
    }
    
    @NSManaged public var ticker: String?
    @NSManaged public var type: String?
}
