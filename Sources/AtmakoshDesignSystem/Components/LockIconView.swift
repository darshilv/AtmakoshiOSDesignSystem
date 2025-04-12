//
//  LockIcon.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/11/25.
//

import SwiftUI
// Lock icon view
public struct LockIconView: View {
    public var body: some View {
        ZStack {
            Circle()
                .fill(ColorTokens.Teal.teal200.opacity(0.8))
                .frame(width:  36, height: 36)
            Image(systemName: "lock.fill")
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
        .padding(SpacingTokens.xs)
    }
}
