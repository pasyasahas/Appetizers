//
//  OrderView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/2/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerCellView(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deletItems)
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("Place order")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Add to Order")
                            .font(.title3)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.brandPrimary)
                    .padding(.bottom, 30)
                }
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", message: "Your have no appetizers in your order.\nAdd some appetizers to place your order.")
                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
