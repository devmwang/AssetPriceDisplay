//
//  AssetPriceDisplayApp.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-07.
//

import SwiftUI

@main
struct AssetPriceDisplayApp: App {
    @StateObject private var dataProvider = DataProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataProvider)
        }
    }
}
