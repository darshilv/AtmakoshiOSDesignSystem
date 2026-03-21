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
    private let isLoading: Bool
    private let action: () -> Void

    @Environment(\.theme) private var theme

    public init(title: String, isLoading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.isLoading = isLoading
        self.action = action
    }

    // MARK: - Body
    public var body: some View {
        Button(action: { if !isLoading { action() } }) {
            ZStack {
                Text(title)
                    .font(.headline)
                    .opacity(isLoading ? 0 : 1)

                if isLoading {
                    ProgressView()
                        .tint(theme.textPrimaryButton)
                }
            }
            .foregroundColor(theme.textPrimaryButton)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(theme.primaryButton.opacity(isLoading ? 0.7 : 1))
        )
        .disabled(isLoading)
    }

}

@available(macOS 10.15.0, *)
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            PrimaryButton(title: "Start Practice", action: {})
            PrimaryButton(title: "Start Practice", isLoading: true, action: {})
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
