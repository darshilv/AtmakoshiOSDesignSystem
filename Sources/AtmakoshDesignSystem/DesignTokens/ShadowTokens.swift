//
//  ShadowTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI

@available(macOS 10.15, *)
/// Shadow configuration tokens for consistent elevation effects
public enum ShadowTokens {
    public struct ShadowStyle : Sendable, Equatable{
        public let color: Color
        public let radius: CGFloat
        public let x: CGFloat
        public let y: CGFloat
        
        public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
            self.color = color
            self.radius = radius
            self.x = x
            self.y = y
        }
    }
    
    // Tailwind-inspired shadows
    public static let sm = ShadowStyle(
        color: Color.black.opacity(0.1),
        radius: 2,
        x: 0,
        y: 1
    )
    
    public static let md = ShadowStyle(
        color: Color.black.opacity(0.1),
        radius: 4,
        x: 0,
        y: 2
    )
    
    public static let lg = ShadowStyle(
        color: Color.black.opacity(0.1),
        radius: 10,
        x: 0,
        y: 4
    )
    
    public static let xl = ShadowStyle(
        color: Color.black.opacity(0.1),
        radius: 15,
        x: 0,
        y: 8
    )
    
    public static let xxl = ShadowStyle(
        color: Color.black.opacity(0.1),
        radius: 25,
        x: 0,
        y: 10
    )
}

// Convenience extension
@available(macOS 10.15, *)
public extension View {
    /// Apply a shadow style from the tokens
    func applyShadow(_ style: ShadowTokens.ShadowStyle) -> some View {
        self.shadow(
            color: style.color,
            radius: style.radius,
            x: style.x,
            y: style.y
        )
    }
}
