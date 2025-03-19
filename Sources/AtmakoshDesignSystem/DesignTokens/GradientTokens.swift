//
//  GradientTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 3/17/25.
//

import SwiftUI

@available(macOS 10.15, *)
// Tailwind-inspired color system
public enum GradientTokens {
    public static let darkGreen = Color(hex: "1A201C")
    public static let darkTeal = Color(hex: "214345")
    public static let mediumTeal = Color(hex: "467275")
    public static let lightTeal = Color(hex: "91B0B2")
   // public static let teal50 = Color(hex: "D7EEEB")
    
    // Predefined gradient
    public static let backgroundGradient = LinearGradient(
        gradient: SwiftUI.Gradient(colors: [
            ColorTokens.Teal.teal50,
            ColorTokens.Teal.teal300,
            ColorTokens.Teal.teal600
            //darkGreen,
            //darkTeal
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
}
