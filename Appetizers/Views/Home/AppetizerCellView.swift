//
//  AppetizerCellView.swift
//  Appetizers
//
//  Created by Pasya Sahas on 4/3/25.
//

import SwiftUI

struct AppetizerCellView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            // MARK: Use the following if caching is needed
            //            AppetizerRemoteImage(urlString: appetizer.imageURL)
            //                .aspectRatio(contentMode: .fit)
            //                .frame(width: 120, height: 90)
            //                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCellView(appetizer: MockData.sampleAppetizer)
}
