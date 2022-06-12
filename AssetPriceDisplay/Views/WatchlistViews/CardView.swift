//
//  CardView.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-10.
//

import SwiftUI

struct CardView: View {
    let asset: Asset
    
    var body: some View {
        HStack {
            VStack {
                Text(asset.ticker ?? "Unknown")
                    .font(.headline)
                Spacer()
                Text(asset.type ?? "Unknown")
                    .font(.caption)
            }
            Spacer()
            Text(asset.type ?? "Unknown")
                .font(.headline)
        }
        .padding()
    }
}
