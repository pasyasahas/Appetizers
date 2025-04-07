//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/4/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alert: AlertItem?
    @Published var alertIsDisplayed = false
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alert = AlertContext.userSaveSuccess
            alertIsDisplayed = true
        } catch  {
            alert = AlertContext.invalidUserData
            alertIsDisplayed = true
        }
    }
    
    
    func retriveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch  {
            alert = AlertContext.invalidUserData
            alertIsDisplayed = true
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alert = AlertContext.invalidForm
            alertIsDisplayed = true
            return false
        }
        
        guard user.email.isValidEmail else {
            alert = AlertContext.invalidEmail
            alertIsDisplayed = true
            return false
        }
        
        return true
    }
}
