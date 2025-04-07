//
//  User.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/7/25.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNappies = false
    var frequentRefills = false
}
