//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/3/25.
//

import Foundation

final class AppetizersListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var alertIsPresented = false
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        self.alertIsPresented = true
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        self.alertIsPresented = true
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        self.alertIsPresented = true
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        self.alertIsPresented = true
                    }
                }
            }
        }
    }
}
