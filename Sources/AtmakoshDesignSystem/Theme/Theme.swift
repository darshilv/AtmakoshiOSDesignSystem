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
    
    public let secondary: Color
    
    public let tertiary: Color
    
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
        primary: Color = ColorTokens.Teal.teal600,
        secondary: Color = ColorTokens.Teal.teal500,
        tertiary: Color = ColorTokens.Teal.teal400,
        accent: Color = ColorTokens.Purple.purple500,
        background: Color = ColorTokens.Gray.gray50,
        backgroundSecondary: Color = ColorTokens.Gray.gray100,
        backgroundTertiary: Color = ColorTokens.Gray.gray200,
        textPrimary: Color = ColorTokens.Teal.teal900,
        textSecondary: Color = ColorTokens.Teal.teal700,
        textTertiary: Color = ColorTokens.Teal.teal600,
        textPrimaryButton: Color = ColorTokens.Teal.teal950,
        success: Color = ColorTokens.Green.green500,
        warning: Color = ColorTokens.Yellow.yellow500,
        error: Color = ColorTokens.Red.red500,
        info: Color = ColorTokens.Blue.blue500
    ) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
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
            // Brand Colors
            primary: ColorTokens.Teal.teal900,
            secondary: ColorTokens.Teal.teal500,
            tertiary: ColorTokens.Teal.teal400,
            accent: ColorTokens.Blue.blue500,

            // Background Colors
            background: ColorTokens.Gray.gray50,
            backgroundSecondary: ColorTokens.Gray.gray100,
            backgroundTertiary: ColorTokens.Gray.gray200,

            // Text Colors
            textPrimary: ColorTokens.Teal.teal900,
            textSecondary: ColorTokens.Teal.teal700,
            textTertiary: ColorTokens.Teal.teal100,
            textPrimaryButton: ColorTokens.Gray.gray50,

            // Status Colors
            success: ColorTokens.Green.green500,
            warning: ColorTokens.Yellow.yellow500,
            error: ColorTokens.Red.red500,
            info: ColorTokens.Blue.blue500
        )
    }

    /// Creates a teal-themed variant for dark mode with high-contrast colors
    public static func yogakoshDarkTheme() -> Theme {
        Theme(
            // Brand Colors - Optimized for dark mode contrast
            primary: ColorTokens.Teal.teal600,
            secondary: ColorTokens.Teal.teal500,
            tertiary: ColorTokens.Teal.teal400,
            accent: ColorTokens.Blue.blue400,

            // Background Colors
            background: ColorTokens.Gray.gray900,
            backgroundSecondary: ColorTokens.Gray.gray800,
            backgroundTertiary: ColorTokens.Gray.gray700,

            // Text Colors
            textPrimary: ColorTokens.Cream.cream300,
            textSecondary: ColorTokens.Cream.cream400,
            textTertiary: ColorTokens.Cream.cream500,
            textPrimaryButton: ColorTokens.Teal.teal950,

            // Status Colors - Brightened for dark mode
            success: ColorTokens.Green.green400,
            warning: ColorTokens.Yellow.yellow400,
            error: ColorTokens.Red.red400,
            info: ColorTokens.Blue.blue400
        )
    }
    
   
}
