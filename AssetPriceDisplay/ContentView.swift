//
//  ContentView.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-07.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    let dataProvider = DataProvider.DataProviderInstance
    
    @State private var isPresentingNewAssetView = false
    @State private var newAssetData = AssetModel.Data()
    
    var body: some View {
        NavigationView {
            WatchlistView()
                .navigationTitle("Watchlist")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isPresentingNewAssetView = true
                        }) {
                            Label("Add Asset", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isPresentingNewAssetView) {
                    NavigationView {
                        EditView(data: $newAssetData)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Dismiss") {
                                        isPresentingNewAssetView = false
                                        newAssetData = AssetModel.Data()
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Add") {
                                        let asset = Asset(context: managedObjectContext)
                                        asset.ticker = newAssetData.ticker
                                        asset.type = newAssetData.type
                                        dataProvider.persistAllChanges()
                                        
                                        isPresentingNewAssetView = false
                                        newAssetData = AssetModel.Data()
                                    }
                                }
                        }
                    }
                }
        }
    }
    
    private func addAsset() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        
        ContentView()
            .previewDevice("iPhone 12 Pro")
            .preferredColorScheme(.dark)
            .environment(\.managedObjectContext, DataProvider.preview.persistentContainer.viewContext)
    }
}
