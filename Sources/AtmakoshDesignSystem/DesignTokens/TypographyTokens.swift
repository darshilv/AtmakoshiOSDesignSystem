//
//  TypographyTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/14/25.
//

//
//  TypographyTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/14/25.
//

import SwiftUI

@available(macOS 10.15, *)
public enum TypographyTokens {
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
    
    // Font styles using system fonts
    public static func heading1() -> Font {
        Font.system(size: Size.xxxl, weight: Weight.bold)
    }
    
    public static func heading2() -> Font {
        Font.system(size: Size.xxl, weight: Weight.bold)
    }
    
    public static func heading3() -> Font {
        Font.system(size: Size.xl, weight: Weight.bold)
    }
    
    public static func body() -> Font {
        Font.system(size: Size.md, weight: Weight.regular)
    }
    
    public static func caption() -> Font {
        Font.system(size: Size.xs, weight: Weight.regular)
    }
    
    public static func titleFont() -> Font {
        Font.system(size: Size.xxl, weight: Weight.bold)
    }
    
    // New additions for Yogakosh home page based on iOS Music app
    
    // App name in header - bold, prominent
    public static func appNameHeader() -> Font {
        Font.system(size: Size.xl, weight: Weight.bold)
    }
    
    // Welcome header (like "Home" in Music app)
    public static func welcomeHeader() -> Font {
        Font.system(size: Size.xxxl, weight: Weight.bold)
    }
    
    // Section headers (like "Top Picks for You" in Music app)
    public static func sectionHeader() -> Font {
        Font.system(size: Size.lg, weight: Weight.bold)
    }
    
    // Section subheaders (like "Made for You" in Music app)
    public static func sectionSubheader() -> Font {
        Font.system(size: Size.sm, weight: Weight.regular)
    }
    
    // Card title (like playlist names in Music app)
    public static func cardTitle() -> Font {
        Font.system(size: Size.lg, weight: Weight.bold)
    }
    
    // Card subtitle (like descriptions in Music app)
    public static func cardSubtitle() -> Font {
        Font.system(size: Size.sm, weight: Weight.medium)
    }
    
    // Label text (for buttons and interactive elements)
    public static func labelText() -> Font {
        Font.system(size: Size.md, weight: Weight.medium)
    }
}

// Extension for easy access to typography
@available(macOS 10.15, *)
public extension Font {
    static var ds: TypographyTokens.Type { TypographyTokens.self }
}
