//
//  ColorsExtension.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/14/25.
//


// In ColorExtensions.swift
import SwiftUI

@available(macOS 10.15, *)

// Make the color system accessible through convenient extensions
public extension Color {
    static var ds: ColorTokens.Semantic.Type { ColorTokens.Semantic.self }
    static var slate: ColorTokens.Slate.Type { ColorTokens.Slate.self }
    static var gray: ColorTokens.Gray.Type { ColorTokens.Gray.self }
    static var zinc: ColorTokens.Zinc.Type { ColorTokens.Zinc.self }
    static var blue: ColorTokens.Blue.Type { ColorTokens.Blue.self }
    static var green: ColorTokens.Green.Type { ColorTokens.Green.self }
    static var red: ColorTokens.Red.Type { ColorTokens.Red.self }
    static var yellow: ColorTokens.Yellow.Type { ColorTokens.Yellow.self }
    static var purple: ColorTokens.Purple.Type { ColorTokens.Purple.self }
}

@available(macOS 10.15, *)
extension Color {
    /// Initialize a Color using a hex string (e.g. "#FF0000" or "FF0000")
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
