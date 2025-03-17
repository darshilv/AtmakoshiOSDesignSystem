//
//  RadiusTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI

/// Corner radius tokens for consistent UI rounding
public enum RadiusTokens {
    public static let none: CGFloat = 0
    public static let sm: CGFloat = 2
    public static let md: CGFloat = 4
    public static let lg: CGFloat = 8
    public static let xl: CGFloat = 12
    public static let xxl: CGFloat = 16
    public static let full: CGFloat = 9999
    }

// Convenience accessor
public extension CGFloat {
    static var radius: RadiusTokens.Type { RadiusTokens.self }
}
