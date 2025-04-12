//
//  PlaceholderImageExtension.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/11/25.
//

import SwiftUI

// Placeholder for when image isn't available
public var placeholderView: some View {
    Rectangle()
        .fill(ColorTokens.Teal.teal50)
        .frame(height: 180)
        .overlay(
            Group {
                if #available(iOS 13.0, macOS 11.0, *) {
                    Image(systemName: "figure.yoga")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(ColorTokens.Teal.teal200)
                        .frame(width: 50, height: 50)
                } else {
                    Text("🧘")
                        .font(.system(size: 50))
                }
            }
        )
}
