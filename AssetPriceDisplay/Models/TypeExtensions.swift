//
//  TypeExtensions.swift
//  AssetPriceDisplay
//
//  Created by Michael Wang on 2022-06-11.
//

import Foundation

extension Double {
    // Extend "Double" to return string-ified value
    var stringValue: String {
        return String(format: "%.2f", self)
    }
}
