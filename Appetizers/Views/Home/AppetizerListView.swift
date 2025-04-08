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
        ZStack {
            NavigationStack {
                List(vm.appetizers) { appetizer in
                    AppetizerCellView(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                vm.isShowingDetail = true
                                vm.selectedAppetizer = appetizer
                            }
                        }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Appetizers")
            }
            .task {
                await vm.getAppetizers()
            }
            .blur(radius: vm.isShowingDetail ? 20 : 0)
            .disabled(vm.isShowingDetail)
            
            if vm.isShowingDetail {
                AppetizerDetailView(appetizer: vm.selectedAppetizer!,
                                    isShowingDetail: $vm.isShowingDetail)
            }
            
            if vm.isLoading {
                ProgressView()
                    .tint(.brandPrimary)
                    .scaleEffect(2)
            }
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
