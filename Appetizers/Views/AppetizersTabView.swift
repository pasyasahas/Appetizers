//
//  AppetizersTabView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/2/25.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView {
            Tab {
                AppetizerListView()
            } label: {
                Image(systemName: "house")
                Text("Home")
            }
            
            Tab {
                AccountView()
            } label: {
                Image(systemName: "person")
                Text("Account")
            }
            
            Tab {
                OrderView()
            } label: {
                Image(systemName: "cart")
                Text("Orders")
            }

        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizersTabView()
}
