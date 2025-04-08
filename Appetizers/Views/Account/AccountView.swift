//
//  AccountView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/2/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var vm = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Personal Info Section
                Section {
                    TextField("First Name", text: $vm.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    TextField("Last Name", text: $vm.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $vm.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday",
                               selection: $vm.user.birthday,
                               in: Date().oneHundredYearsAgo...Date().eighteenYearsAgo,
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
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
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
