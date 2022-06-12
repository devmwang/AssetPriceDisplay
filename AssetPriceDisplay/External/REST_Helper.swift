//
//  REST_Helper.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-10.
//

// https://ftx.com/api/markets/{ticker}-PERP

import Foundation

enum FetchError: Error {
    case badRequest
    case badJSON
}

class REST_Helper: ObservableObject {
    func getFTXPrice(assetTicker: String) async throws {
        guard let url = URL(string: "https://ftx.com/api/markets/{ticker}-PERP") else {
            return
        }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        return 
    }
}
