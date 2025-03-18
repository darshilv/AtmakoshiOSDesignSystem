//
//  TypographyTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/14/25.
//


import SwiftUI

@available(macOS 10.15, *)
public enum TypographyTokens {
    // Font families
    public static let primaryFontRegular = "SFProText-Regular"
    public static let primaryFontMedium = "SFProText-Medium"
    public static let primaryFontBold = "SFProText-Bold"
    
    // Font sizes
    public enum Size {
        public static let xs: CGFloat = 12
        public static let sm: CGFloat = 14
        public static let md: CGFloat = 16
        public static let lg: CGFloat = 18
        public static let xl: CGFloat = 20
        public static let xxl: CGFloat = 24
        public static let xxxl: CGFloat = 30
        public static let xxxxl: CGFloat = 36
    }
    
    // Font weights
    public enum Weight {
        public static let regular = Font.Weight.regular
        public static let medium = Font.Weight.medium
        public static let semibold = Font.Weight.semibold
        public static let bold = Font.Weight.bold
    }
    
    // Font styles
    public static func heading1() -> Font {
        Font.custom(primaryFontBold, size: Size.xxxl)
    }
    
    public static func heading2() -> Font {
        Font.custom(primaryFontBold, size: Size.xxl)
    }
    
    public static func heading3() -> Font {
        Font.custom(primaryFontBold, size: Size.xl)
    }
    
    public static func body() -> Font {
        Font.custom(primaryFontRegular, size: Size.md)
    }
    
    public static func caption() -> Font {
        Font.custom(primaryFontRegular, size: Size.xs)
    }
}

// Extension for easy access to typography
@available(macOS 10.15, *)
public extension Font {
    static var ds: TypographyTokens.Type { TypographyTokens.self }
}
