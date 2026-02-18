//
//  ThemeManager.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI
import Combine

/// Manages the current theme and provides ways to change it
@MainActor
public final class ThemeManager: ObservableObject {
    /// Shared instance for app-wide theme management
    public static let shared = ThemeManager()
    
    /// Current active theme
    @Published public private(set) var current: Theme = Theme()
    
    private init() {}
    
    /// Apply a new theme
    public func apply(_ theme: Theme) {
        self.current = theme
    }
    
    /// Reset to default theme
    public func resetToDefault() {
        self.current = Theme()
    }
    
    /// Apply the green variant
    public func applyYogakoshTheme() {
        self.current = Theme.yogakoshTheme()
    }
    
 }

// Environment key for SwiftUI integration
public struct ThemeKey: EnvironmentKey {
    public static let defaultValue = Theme()
}

public extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
