//
//  Item.swift
//  screen 3 (checkout2)
//
//  Created by Jacques Antoine Vidjanagni on 2025-03-01.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
