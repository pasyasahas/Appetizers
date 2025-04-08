//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/8/25.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}
