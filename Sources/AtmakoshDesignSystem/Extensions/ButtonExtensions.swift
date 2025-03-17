import SwiftUI

@available(macOS 10.15, *)
public extension Button {
    func primaryStyle() -> some View {
        self
            .padding(.horizontal, SpacingTokens.md)
            .padding(.vertical, SpacingTokens.sm)
            .background(Color.ds.primary)
            .foregroundColor(.white)
            .cornerRadius(RadiusTokens.xl)
    }
    
    func secondaryStyle() -> some View {
        self
            .padding(.horizontal, SpacingTokens.md)
            .padding(.vertical, SpacingTokens.sm)
            .background(Color.ds.secondary)
            .foregroundColor(Color.ds.textPrimary)
            .cornerRadius(RadiusTokens.xl)
    }
    
    func ghostStyle() -> some View {
        self
            .padding(.horizontal, SpacingTokens.md)
            .padding(.vertical, SpacingTokens.sm)
            .background(Color.clear)
            .foregroundColor(Color.ds.primary)
            .overlay(
                RoundedRectangle(cornerRadius: RadiusTokens.xl)
                    .stroke(Color.ds.primary, lineWidth: 1)
            )
    }
}
