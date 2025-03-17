//
//  ViewExtensions.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI

@available(macOS 10.15, *)
public extension View {
    func cardStyle() -> some View {
        self
            .padding(SpacingTokens.md)
            .background(Color.ds.backgroundPrimary)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
    
    func roundedBorder() -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.ds.secondary.opacity(0.3), lineWidth: 1)
            )
    }
}
