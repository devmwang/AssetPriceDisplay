//
//  ContentView.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-07.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dataProvider: DataProvider
    
    var body: some View {
        NavigationView {
            WatchlistView()
                .environmentObject(dataProvider)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
