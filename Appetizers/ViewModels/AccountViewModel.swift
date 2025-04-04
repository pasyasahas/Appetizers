//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/4/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNappies = false
    @Published var frequentRefills = false
    
    @Published var alert: AlertItem?
    @Published var alertIsDisplayed = false
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alert = AlertContext.invalidForm
            alertIsDisplayed = true
            return false
        }
        
        guard email.isValidEmail else {
            alert = AlertContext.invalidEmail
            alertIsDisplayed = true
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("Changes have been saved succesfully")
    }
}
