//
//  ThemeShadowModifier.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI

// Access theme via Environment
public extension View {
    /// Apply the given theme to this view and its descendants
    func applyTheme(_ theme: Theme) -> some View {
        self.environment(\.theme, theme)
    }
    
    /// Apply the current theme from ThemeManager to this view and its descendants
    func applyCurrentTheme() -> some View {
        self.environment(\.theme, ThemeManager.shared.current)
    }
    
    /// Apply the default theme
    func applyDefaultTheme() -> some View {
        self.environment(\.theme, Theme())
    }
}

// Shadow and Radius modifiers
public extension View {
    /// Apply small shadow from current theme
    func smallShadow() -> some View {
        self.modifier(ThemeShadowModifier(shadowType: .small))
    }
    
    /// Apply medium shadow from current theme
    func mediumShadow() -> some View {
        self.modifier(ThemeShadowModifier(shadowType: .medium))
    }
    
    /// Apply large shadow from current theme
    func largeShadow() -> some View {
        self.modifier(ThemeShadowModifier(shadowType: .large))
    }
    
    /// Apply XL shadow from current theme
    func xlShadow() -> some View {
        self.modifier(ThemeShadowModifier(shadowType: .xl))
    }
    
    /// Apply small corner radius from current theme
    func smallRadius() -> some View {
        self.modifier(ThemeRadiusModifier(radiusType: .small))
    }
    
    /// Apply medium corner radius from current theme
    func mediumRadius() -> some View {
        self.modifier(ThemeRadiusModifier(radiusType: .medium))
    }
    
    /// Apply large corner radius from current theme
    func largeRadius() -> some View {
        self.modifier(ThemeRadiusModifier(radiusType: .large))
    }
    
    /// Apply XL corner radius from current theme
    func xlRadius() -> some View {
        self.modifier(ThemeRadiusModifier(radiusType: .xl))
    }
    
    /// Apply full (circular) corner radius from current theme
    func fullRadius() -> some View {
        self.modifier(ThemeRadiusModifier(radiusType: .full))
    }
}

// Shadow Modifier
fileprivate struct ThemeShadowModifier: ViewModifier {
    @Environment(\.theme) private var theme
    
    enum ShadowType {
        case small, medium, large, xl
    }
    
    let shadowType: ShadowType
    
    func body(content: Content) -> some View {
        let shadow: ShadowTokens.ShadowStyle
        
        switch shadowType {
        case .small:
            shadow = ShadowTokens.sm
        case .medium:
            shadow = ShadowTokens.md
        case .large:
            shadow = ShadowTokens.lg
        case .xl:
            shadow = ShadowTokens.xl
        }
        
        return content
            .shadow(
                color: shadow.color,
                radius: shadow.radius,
                x: shadow.x,
                y: shadow.y
            )
    }
}

// Radius Modifier
fileprivate struct ThemeRadiusModifier: ViewModifier {
    @Environment(\.theme) private var theme
    
    enum RadiusType {
        case small, medium, large, xl, full
    }
    
    let radiusType: RadiusType
    
    func body(content: Content) -> some View {
        let radius: CGFloat
        
        switch radiusType {
        case .small:
            radius = RadiusTokens.sm
        case .medium:
            radius = RadiusTokens.md
        case .large:
            radius = RadiusTokens.lg
        case .xl:
            radius = RadiusTokens.xl
        case .full:
            radius = RadiusTokens.full
        }
        
        return content.cornerRadius(radius)
    }
}
