//
//  PlaceholderImageExtension.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/11/25.
//

import SwiftUI

// Placeholder for when image isn't available
public var PlaceholderImage: some View {
    Rectangle()
        .fill(Color.white.opacity(0))
        .frame(width: 100, height: 100)
      
        .overlay(
            Group {
                if #available(iOS 13.0, macOS 11.0, *) {
                    Image(systemName: "figure.yoga")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(ColorTokens.Teal.teal200)
                        .frame(width: 70, height: 70)
                } else {
                    Text("🧘")
                        .font(.system(size: 50))
                }
            }
        )
}
