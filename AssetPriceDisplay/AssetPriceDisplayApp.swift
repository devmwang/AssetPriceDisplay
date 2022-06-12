//
//  AssetPriceDisplayApp.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-07.
//

import SwiftUI

@main
struct AssetPriceDisplayApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    let dataProvider = DataProvider.DataProviderInstance
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataProvider.persistentContainer.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            dataProvider.persistAllChanges()
        }
    }
}
