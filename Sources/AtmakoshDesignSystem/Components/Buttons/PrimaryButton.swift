//
//  PrimaryButton.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI

@available(macOS 10.15, *)
public struct PrimaryButton: View {
    private let title: String
    private let action: () -> Void
    
    @Environment(\.theme) private var theme
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
            //.padding(.horizontal, isFullWidth ? 0 : horizontalPadding)
        }
        .background(
             RoundedRectangle(cornerRadius: 20)
                .fill(ColorTokens.Teal.teal900)
            
        )
       // .padding(.horizontal, isFullWidth ? horizontalPadding : 0)
    }
    
}

@available(macOS 10.15.0, *)
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Start Practice", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
