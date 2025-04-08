//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/3/25.
//

import Foundation

@MainActor
final class AppetizersListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var alertIsPresented = false
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() async {
        self.isLoading = true
        do {
            self.appetizers = try await NetworkManager.shared.getAppetizers()
            self.isLoading = false
        } catch {
            if let apError = error as? APError {
                switch apError {
                case .invalidURL:
                    self.alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    self.alertItem = AlertContext.invalidResponse
                case .invalidData:
                    self.alertItem = AlertContext.invalidData
                case .unableToComplete:
                    self.alertItem = AlertContext.unableToComplete
                }
            } else {
                self.alertItem = AlertContext.invalidResponse
            }
            self.alertIsPresented = true
            self.isLoading = false
        }
    }
}
