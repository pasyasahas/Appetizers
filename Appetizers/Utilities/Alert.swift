//
//  Alert.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/3/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: String
    let message: String
}

struct AlertContext {
    static let invalidData = AlertItem(title: "Server Error",
                                              message: "Data recieved from server is invalid. Please contact support.")
    static let invalidResponse = AlertItem(title: "Server Error",
                                                message: "Invalid response from server. Please try again.")
    static let invalidURL = AlertItem(title: "Server Error",
                                              message: "There was an error connecting to the server. Please try again later.")
    static let unableToComplete = AlertItem(title: "Server Error",
                                                message: "Unable to complete request. Please check your internet connection.")
}
