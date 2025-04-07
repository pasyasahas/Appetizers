//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/7/25.
//

import SwiftUI

struct EmptyStateView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyStateView(imageName: "empty-order", message: "This is a long test message for the empty state for testing purposes")
}
