//
//  Theme.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


// Theme.swift
import SwiftUI

/// Theme defines the customizable design tokens for your design system
public struct Theme: Sendable, Equatable {
    // MARK: - Brand Colors
    public let primary: Color
    public let primaryDark: Color
    public let primaryLight: Color
    
    public let secondary: Color
    public let secondaryDark: Color
    public let secondaryLight: Color
    
    public let tertiary: Color
    public let tertiaryDark: Color
    public let tertiaryLight: Color
    
    public let accent: Color
    
    // MARK: - Background Colors
    public let background: Color
    public let backgroundSecondary: Color
    public let backgroundTertiary: Color
    
    // MARK: - Text Colors
    public let textPrimary: Color
    public let textSecondary: Color
    public let textTertiary: Color
    public let textPrimaryButton: Color
    
    // MARK: - Status Colors
    public let success: Color
    public let warning: Color
    public let error: Color
    public let info: Color
    
    /// Default theme initialization with default values
    public init(
        primary: Color = ColorTokens.Blue.blue500,
        primaryDark: Color = ColorTokens.Blue.blue700,
        primaryLight: Color = ColorTokens.Blue.blue300,
        secondary: Color = ColorTokens.Indigo.indigo500,
        secondaryDark: Color = ColorTokens.Indigo.indigo700,
        secondaryLight: Color = ColorTokens.Indigo.indigo300,
        tertiary: Color = ColorTokens.Teal.teal400,
        tertiaryDark: Color = ColorTokens.Teal.teal500,
        tertiaryLight: Color = ColorTokens.Teal.teal300,
        accent: Color = ColorTokens.Purple.purple500,
        background: Color = ColorTokens.Gray.gray50,
        backgroundSecondary: Color = ColorTokens.Gray.gray100,
        backgroundTertiary: Color = ColorTokens.Gray.gray200,
        textPrimary: Color = ColorTokens.Gray.gray900,
        textSecondary: Color = ColorTokens.Gray.gray700,
        textTertiary: Color = ColorTokens.Gray.gray500,
        textPrimaryButton: Color = ColorTokens.Teal.teal950,
        success: Color = ColorTokens.Green.green500,
        warning: Color = ColorTokens.Yellow.yellow500,
        error: Color = ColorTokens.Red.red500,
        info: Color = ColorTokens.Blue.blue500
    ) {
        self.primary = primary
        self.primaryDark = primaryDark
        self.primaryLight = primaryLight
        self.secondary = secondary
        self.secondaryDark = secondaryDark
        self.secondaryLight = secondaryLight
        self.tertiary = tertiary
        self.tertiaryDark = tertiaryDark
        self.tertiaryLight = tertiaryLight
        self.accent = accent
        self.background = background
        self.backgroundSecondary = backgroundSecondary
        self.backgroundTertiary = backgroundTertiary
        self.textPrimaryButton = textPrimaryButton
        self.textPrimary = textPrimary
        self.textSecondary = textSecondary
        self.textTertiary = textTertiary
        self.success = success
        self.warning = warning
        self.error = error
        self.info = info
    }
    
    // MARK: - Predefined Themes
    
    /// Creates a teal-themed variant for light mode
    public static func yogakoshTheme() -> Theme {
        Theme(
            primary: ColorTokens.Teal.teal800,
            primaryDark: ColorTokens.Teal.teal900,
            primaryLight: ColorTokens.Teal.teal400,
            secondary: ColorTokens.Teal.teal500,
            secondaryDark: ColorTokens.Teal.teal700,
            secondaryLight: ColorTokens.Teal.teal300,
            accent: ColorTokens.Blue.blue500,
            
            textPrimaryButton: ColorTokens.Gray.gray50
            
        )
    }

    /// Creates a teal-themed variant for dark mode with high-contrast colors
    public static func yogakoshDarkTheme() -> Theme {
        Theme(
            // Brand Colors - Optimized for dark mode contrast
            primary: ColorTokens.Teal.teal600,        // #2dd4bf - 8.52:1 contrast
            primaryDark: ColorTokens.Cream.cream50,
            primaryLight: ColorTokens.Teal.teal200,
            secondary: ColorTokens.Teal.teal500,      // Lighter teal shade
            secondaryDark: ColorTokens.Cream.cream100,
            secondaryLight: ColorTokens.Teal.teal400,
            tertiary: ColorTokens.Teal.teal800,
            tertiaryDark: ColorTokens.Cream.cream200,
            tertiaryLight: ColorTokens.Teal.teal600,
            accent: ColorTokens.Blue.blue400,         // Brightened blue for dark mode

            // Background Colors
            background: ColorTokens.Gray.gray900,
            backgroundSecondary: ColorTokens.Gray.gray800,
            backgroundTertiary: ColorTokens.Gray.gray700,

            // Text Colors
            textPrimary: ColorTokens.Cream.cream50,
           // textPrimary: ColorTokens.Gray.gray50,
            textSecondary: ColorTokens.Cream.cream100,
            textTertiary: ColorTokens.Cream.cream200,
            textPrimaryButton: ColorTokens.Teal.teal950,

            // Status Colors - Brightened for dark mode
            success: ColorTokens.Green.green400,
            warning: ColorTokens.Yellow.yellow400,
            error: ColorTokens.Red.red400,
            info: ColorTokens.Blue.blue400
        )
    }

    /// Creates a purple-themed variant
    public static func purpleTheme() -> Theme {
        Theme(
            primary: ColorTokens.Purple.purple600,
            primaryDark: ColorTokens.Purple.purple800,
            primaryLight: ColorTokens.Purple.purple400,
            secondary: ColorTokens.Indigo.indigo500,
            secondaryDark: ColorTokens.Indigo.indigo700,
            secondaryLight: ColorTokens.Indigo.indigo300,
            accent: ColorTokens.Pink.pink500
        )
    }
    
    /// Creates a dark mode theme with high-contrast colors for accessibility
    public static func darkTheme() -> Theme {
        Theme(
            // Brand Colors - Optimized for dark mode contrast
            primary: ColorTokens.Teal.teal400,        // #2dd4bf - 8.52:1 contrast
            primaryDark: ColorTokens.Cream.cream50,
            primaryLight: ColorTokens.Teal.teal300,
            secondary: ColorTokens.Teal.teal500,      // #14b8a6 - 6.14:1 contrast
            secondaryDark: ColorTokens.Cream.cream200,
            secondaryLight: ColorTokens.Teal.teal400,
            accent: ColorTokens.Teal.teal400,
            

            // Background Colors
            background: ColorTokens.Gray.gray900,
            backgroundSecondary: ColorTokens.Gray.gray800,
            backgroundTertiary: ColorTokens.Gray.gray700,

            // Text Colors
            textPrimary: ColorTokens.Gray.gray50,
            textSecondary: ColorTokens.Gray.gray300,
            textTertiary: ColorTokens.Gray.gray500,

            // Status Colors - Brightened for dark mode
            success: ColorTokens.Green.green400,
            warning: ColorTokens.Yellow.yellow400,
            error: ColorTokens.Red.red400,
            info: ColorTokens.Blue.blue400
        )
    }
    
   
}
