//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/8/25.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
