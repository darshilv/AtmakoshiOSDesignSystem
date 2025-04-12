// Lock icon view
    private var lockIcon: some View {
        ZStack {
            Circle()
                .fill(ColorTokens.Teal.teal200.opacity(0.8))
                .frame(width: size == .regular ? 36 : 28, height: size == .regular ? 36 : 28)
            
            if #available(iOS 13.0, macOS 11.0, *) {
                Image(systemName: "lock.fill")
                    .foregroundColor(.white)
                    .font(.system(size: size == .regular ? 16 : 12))
            } else {
                Text("🔒")
                    .font(.system(size: size == .regular ? 16 : 12))
            }
        }
        .padding(size == .regular ? SpacingTokens.xs : SpacingTokens.xxs)
    }