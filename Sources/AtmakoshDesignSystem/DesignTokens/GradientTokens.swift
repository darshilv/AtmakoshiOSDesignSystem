//
//  GradientTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 3/17/25.
//

import SwiftUI
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

@available(macOS 10.15, *)
// Tailwind-inspired color system
public enum GradientTokens {
    public static let darkGreen = Color(hex: "1A201C")
    public static let darkTeal = Color(hex: "214345")
    public static let mediumTeal = Color(hex: "467275")
    public static let lightTeal = Color(hex: "91B0B2")
   // public static let teal50 = Color(hex: "D7EEEB")

    // Adaptive background gradient that changes based on light/dark mode
    public static var backgroundGradient: LinearGradient {
        #if os(iOS)
        let isDark = UITraitCollection.current.userInterfaceStyle == .dark
        #elseif os(macOS)
        let isDark = NSApp?.effectiveAppearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
        #else
        let isDark = false
        #endif

        if isDark {
            // Dark mode gradient - dark gray to darker teal
            return LinearGradient(
                gradient: SwiftUI.Gradient(colors: [
                    ColorTokens.Gray.gray900,      // #111827 - dark background
                    darkTeal                        // #214345 - darker teal
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        } else {
            // Light mode gradient - light beige to light teal
            return LinearGradient(
                gradient: SwiftUI.Gradient(colors: [
                    Color(hex: "E8E0D6"),          // Light beige
                    Color(hex: "C6D8D8")           // Light teal
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}
