//
//  Color+Adaptive.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 2/14/26.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
extension Color {
    /// Creates an adaptive color that changes based on light/dark mode
    /// - Parameters:
    ///   - light: Color for light mode
    ///   - dark: Color for dark mode
    /// - Returns: Adaptive Color
    static func adaptive(light: Color, dark: Color) -> Color {
        #if os(iOS)
        return Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
        #elseif os(macOS)
        return Color(NSColor(name: nil) { appearance in
            appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua ? NSColor(dark) : NSColor(light)
        })
        #else
        return light
        #endif
    }
}
