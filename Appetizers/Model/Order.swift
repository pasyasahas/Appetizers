//
//  Order.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/7/25.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deletItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
