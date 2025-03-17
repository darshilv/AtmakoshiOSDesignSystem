//
//  TextExtensions.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/14/25.
//

// TextExtensions.swift
import SwiftUI

public extension Text {
    /// Applies heading 1 style
    func headingStyle() -> some View {
        modifier(HeadingStyleModifier())
    }
    
    /// Applies subheading style
    func subheadingStyle() -> some View {
        modifier(SubheadingStyleModifier())
    }
    
    /// Applies body text style
    func bodyStyle() -> some View {
        modifier(BodyStyleModifier())
    }
    
    /// Applies caption style
    func captionStyle() -> some View {
        modifier(CaptionStyleModifier())
    }
}

// Modifiers for text styles
struct HeadingStyleModifier: ViewModifier {
    @Environment(\.theme) private var theme
    
    func body(content: Content) -> some View {
        content
            .font(Font.ds.heading1())
            .foregroundColor(theme.textPrimary)
    }
}

struct SubheadingStyleModifier: ViewModifier {
    @Environment(\.theme) private var theme
    
    func body(content: Content) -> some View {
        content
            .font(Font.ds.heading2())
            .foregroundColor(theme.textPrimary)
    }
}

struct BodyStyleModifier: ViewModifier {
    @Environment(\.theme) private var theme
    
    func body(content: Content) -> some View {
        content
            .font(Font.ds.body())
            .foregroundColor(theme.textPrimary)
    }
}

struct CaptionStyleModifier: ViewModifier {
    @Environment(\.theme) private var theme
    
    func body(content: Content) -> some View {
        content
            .font(Font.ds.caption())
            .foregroundColor(theme.textSecondary)
    }
}
