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
                    TextField("First Name", text: $vm.user.firstName)
                    TextField("Last Name", text: $vm.user.lastName)
                    TextField("Email", text: $vm.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday",
                               selection: $vm.user.birthday,
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
                    Toggle("Extra Napins", isOn: $vm.user.extraNappies)
                    Toggle("Frequent refils", isOn: $vm.user.frequentRefills)
                } header: {
                    Text("Requests")
                }
            }
            .tint(.brandPrimary)
            .navigationTitle("Account")
        }
        .onAppear {
            vm.retriveUser()
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
