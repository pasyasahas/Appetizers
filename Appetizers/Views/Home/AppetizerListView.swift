//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/2/25.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var vm = AppetizersListViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.appetizers) { appetizer in
                AppetizerCellView(appetizer: appetizer)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Appetizers")
        }
        .onAppear {
            vm.getAppetizers()
        }
        .alert(vm.alertItem?.title ?? "",
               isPresented: $vm.alertIsPresented)
        {}
        message: { Text(vm.alertItem?.message ?? "") }

    }
    
    
}

#Preview {
    AppetizerListView()
}
