//
//  WatchlistView.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-07.
//

import SwiftUI
import CoreData

struct WatchlistView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    let dataProvider = DataProvider.DataProviderInstance
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.ticker)])
    private var watchlist: FetchedResults<Asset>
    
    @State private var data = AssetModel.Data()
    @State private var isPresentingEditAssetView = false

    var body: some View {
        VStack {
            if watchlist.count == 0 {
                VStack {
                    Text("Add an asset to watchlist to get started!")
                }
            } else {
                List {
                    ForEach(watchlist) { asset in
                        Button(action: {
                            isPresentingEditAssetView = true
                        }) {
                            CardView(asset: asset)
                        }
                    }
                    .onDelete(perform: removeAsset)
                }
            }
        }
    }
    
    private func removeAsset(offsets: IndexSet) {       
        withAnimation {
            offsets.map { watchlist[$0] }.forEach(managedObjectContext.delete)

            dataProvider.persistAllChanges()
        }
    }
}
