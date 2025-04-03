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
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
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
