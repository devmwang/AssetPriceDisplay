//
//  EditView.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-10.
//

import SwiftUI

struct EditView: View {
    @Binding var data: AssetModel.Data
    
    let assetTypes: [String] = ["Crypto", "NASDAQ", "NYSE"]
    
    var body: some View {
        Form {
            Section(header: Text("Asset Info")) {
                TextField("Ticker", text: $data.ticker)
                Picker("Type", selection: $data.type) {
                    ForEach(assetTypes, id: \.self) { assetType in
                        Text(assetType).tag(assetType)
                    }
                }
            }
        }
    }
}
