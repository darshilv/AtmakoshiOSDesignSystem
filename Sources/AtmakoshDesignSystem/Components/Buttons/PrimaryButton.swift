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
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.ds.body())
                .fontWeight(Font.ds.Weight.medium)
                .frame(maxWidth: .infinity)
        }
        .primaryStyle()
    }
}

@available(macOS 10.15.0, *)
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Press Me", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
