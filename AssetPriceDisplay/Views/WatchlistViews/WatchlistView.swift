//
//  WatchlistView.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-07.
//

import SwiftUI
import CoreData

struct WatchlistView: View {
    @EnvironmentObject private var dataProvider: DataProvider
    
    
    var body: some View {
        VStack {
            List(dataProvider.watchlist) { asset in
                Text(asset.ticker ?? "Unknown")
                    .swipeActions(allowsFullSwipe: true) {
                        Button("Delete", role: .destructive) {

                        }
                    }
            }
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
