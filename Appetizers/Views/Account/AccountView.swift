//
//  AccountView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/2/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var vm = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                // Personal Info Section
                Section {
                    TextField("First Name", text: $vm.firstName)
                    TextField("Last Name", text: $vm.lastName)
                    TextField("Email", text: $vm.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday",
                               selection: $vm.birthday,
                               displayedComponents: .date)
                    
                    Button {
                        vm.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundStyle(.brandPrimary)
                    }
                } header: {
                    Text("Personal Info")
                }
                
                // Requests Section
                Section {
                    Toggle("Extra Napins", isOn: $vm.extraNappies)
                    Toggle("Frequent refils", isOn: $vm.frequentRefills)
                } header: {
                    Text("Requests")
                }
            }
            .tint(.brandPrimary)
            .navigationTitle("Account")
        }
        .alert(vm.alert?.title ?? "", isPresented: $vm.alertIsDisplayed) {
            
        } message: {
            Text(vm.alert?.message ?? "")
        }

    }
}

#Preview {
    AccountView()
}
