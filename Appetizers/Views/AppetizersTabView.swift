//
//  AppetizersTabView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/2/25.
//

import SwiftUI

struct AppetizersTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            Tab {
                AppetizerListView()
            } label: {
                Label("Home", systemImage: "house")
            }
            
            Tab {
                AccountView()
            } label: {
                Label("Account", systemImage: "person")
            }
            
            Tab {
                OrderView()
            } label: {
                Label("Order", systemImage: "cart")
            }
            .badge(order.items.count)

        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizersTabView()
        .environmentObject(Order())
}
