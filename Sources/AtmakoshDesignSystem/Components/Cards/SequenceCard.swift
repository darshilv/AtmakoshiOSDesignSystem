
import SwiftUI


// MARK: - Sequence Card Component
public struct SequenceCard: View {
    enum Size {
        case regular
        case mini
    }
    
    // Data model for the card - using the existing model from your code
    let sequence: YogaSequence
    var size: Size = .regular
    var onTap: () -> Void
    
    public var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                // Image section
                ZStack(alignment: .topTrailing) {
                    if let imageUrl = sequence.imageUrl, let url = URL(string: imageUrl) {
                        if #available(macOS 12.0, *) {
                            AsyncImage(url: url) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: size == .regular ? 180 : 120)
                                } else if phase.error != nil {
                                    placeholderView
                                } else {
                                    placeholderView
                                }
                            }
                            .clipped()
                        } else {
                            // Fallback on earlier versions
                            placeholderView
                        }
                    } else {
                        placeholderView
                    }
                    
                    // Lock icon if sequence is locked
                    if sequence.isLocked {
                        lockIcon
                    }
                }
                
                // Content area
                VStack(alignment: .leading, spacing: size == .regular ? SpacingTokens.xs : SpacingTokens.xxs) {
                    // Title
                    if #available(macOS 11.0, *) {
                        Text(sequence.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(ColorTokens.Semantic.textPrimary)
                            .lineLimit(1)
                            .padding(.top, SpacingTokens.xs)
                    } else {
                        Text(sequence.name)
                            .font(.system(size:12, weight: .semibold))
                            .foregroundColor(ColorTokens.Semantic.textPrimary)
                            .lineLimit(1)
                            .padding(.top, SpacingTokens.xs)
                        // Fallback on earlier versions
                    }
                    
                    // Duration and Level with icons
                    HStack(spacing: size == .regular ? SpacingTokens.sm : SpacingTokens.xs) {
                        // Duration
                        HStack(spacing: SpacingTokens.xxs) {
                            if #available(iOS 13.0, macOS 11.0, *) {
                                Image(systemName: "clock")
                                    .font(size == .regular ? .callout : .caption)
                                    
                                    .foregroundColor(ColorTokens.Teal.teal900)
                            } else {
                                Text("⏱")
                                    .font(.system(size: size == .regular ? TypographyTokens.Size.md : TypographyTokens.Size.sm))
                            }
                            
                            Text(sequence.durationText)
                                .font(size == .regular ? .callout : .caption)
                                .foregroundColor(ColorTokens.Teal.teal900 )
                        }
                        
                        // Separator
                        Text("•")
                            .foregroundColor(ColorTokens.Teal.teal900)
                            .font(.body)
                        
                        // Level
                        HStack(spacing: SpacingTokens.xxs) {
                            if #available(iOS 13.0, macOS 11.0, *) {
                                Image(systemName: "figure.walk")
                                    .font(size == .regular ? .callout : .caption)
                                    .foregroundColor(ColorTokens.Teal.teal900)
                            } else {
                                Text("🚶")
                                    .font(.system(size: size == .regular ? TypographyTokens.Size.md : TypographyTokens.Size.sm))
                            }
                            
                            Text(sequence.difficulty)
                                .font(size == .regular ? .callout : .caption)
                                .foregroundColor( ColorTokens.Teal.teal900)
                        }
                    }
                    .padding(.vertical, SpacingTokens.xxs)
                    
                    // Description - only show for regular cards or if space permits
                     
//                        Text(sequence.description)
//                            .font(.body)
//                            .foregroundColor(ColorTokens.Teal.teal900)
//                            .lineLimit(1)
//                            .padding(.bottom, SpacingTokens.xs)
                    
                }
                .padding(.horizontal, SpacingTokens.md)
                .background(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.white)
            .cornerRadius(size == .regular ? RadiusTokens.xl : RadiusTokens.lg)
            .applyShadow(size == .regular ? ShadowTokens.md : ShadowTokens.sm)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
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
    
    // Placeholder for when image isn't available
    private var placeholderView: some View {
        Rectangle()
            .fill(ColorTokens.Teal.teal50)
            .frame(height: size == .regular ? 180 : 120)
            .overlay(
                Group {
                    if #available(iOS 13.0, macOS 11.0, *) {
                        Image(systemName: "figure.yoga")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(ColorTokens.Teal.teal200)
                            .frame(width: size == .regular ? 50 : 30, height: size == .regular ? 50 : 30)
                    } else {
                        Text("🧘")
                            .font(.system(size: size == .regular ? 50 : 30))
                    }
                }
            )
    }
}

// MARK: - Mini Sequence Card
struct MiniSequenceCard: View {
    let sequence: YogaSequence  // Using your existing model
    var onTap: () -> Void
    
    var body: some View {
        SequenceCard(
            sequence: sequence,
            size: .mini,
            onTap: onTap
        )
    }
}

// MARK: - Data Model
public struct YogaSequence: Identifiable {
    public let id: String
    public let name: String
    public let description: String
    public let duration: Int // Duration in minutes
    public let difficulty: String
    public let focus: String
   
    public let imageUrl: String?
    public let isLocked: Bool
    
  
   

  
    
    
    public init(
        id: String,
        name: String,
        description: String,
        duration: Int,
        difficulty: String,
        focus: String,
        imageUrl: String?,
        isLocked: Bool
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.duration = duration
        self.difficulty = difficulty
        self.focus = focus
        self.imageUrl = imageUrl
        self.isLocked = isLocked
    }
    
    // Computed property for duration text
    public var durationText: String {
        return "\(duration)min"
    }
}

// MARK: - Preview
struct SequenceCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: SpacingTokens.lg) {
            // Regular card
            SequenceCard(
                sequence: YogaSequence(
                    id: "1",
                    name: "Morning Flow",
                    description: "Gentle awakening, stretching",
                    duration: 20,
                    difficulty: "Beginner",
                    focus: "Core, Flexibility",
                    imageUrl: "https://cvws.icloud-content.com/B/AWiwDwZMsT33M33zClhC8wc7CKY1ASXKf4M-QEm4J0DOzJEsulpprIoD/generate-an-illustration-of-a-yogi-in-king-pigeon-.png?o=AjVsV43PHn15koLps9PtrK2diiBxsLNSJJqcxoB9H7XU&v=1&x=3&a=CAogEwazpksVHHGr12_NYXN9tekeM71eXvb_cpfZgFtBt7YSbRC2j9mD4jIYtuy0heIyIgEAUgQ7CKY1WgRprIoDaibc6urEHPK3CiIdnmlCcebDgh4RgcJEj5ndqSP9KtUzYYfAYntjQHIm7tK6L4drKVzew3CA0YrdeZsIL29SA0PFX-Bh6PeMlyZaBm-Go28&e=1744304944&fl=&r=b940dec7-a93e-4e4d-acdf-7063f6d18d2b-1&k=67xpCKA8wAMbqeKv3Gh7sw&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=76xuLSzbgbviO3eaAlYNpUmATK8&cd=i",
                    isLocked: false
                ),
                onTap: {}
            )
            .frame(width: 350)
            
            
            
            // Mini card
            MiniSequenceCard(
                sequence: YogaSequence(
                    id: "2",
                    name: "Lower Back Relief",
                    description: "lower back, core",
                    duration: 30,
                    difficulty: "Intermediate",
                    focus: "Lower Back,Core",
                    imageUrl: "https://cvws.icloud-content.com/B/AXOn2XaKZFVh4G0le-3bkewIHzdsARM5F618u0DBaK50PRdB-o9nE3m3/generate-an-illustration-of-a-yogi-in-camel-pose-w.png?o=AowaE8whIcurxBT6viggaCCK62Fe1w8iI1_hS5HGxJcS&v=1&x=3&a=CAoggnGpOhgqiFmbxtbnh8wk6yLJX2cc8pjnkJjc6X2zvt8SbRCcjNqD4jIYnOm1heIyIgEAUgQIHzdsWgRnE3m3aib0lKlF5-1n-6tKO482RTOL1QdgsZVg_m_8a9qFf4NYgwi2HOnP2nIm-Wg_mNrIGluS4kVhXQJmHaXcYG-DqFsiITLN4JH5dC8WTatMjHU&e=1744304960&fl=&r=1011d22d-8676-45ea-b7f2-9e6fe889a5e6-1&k=d4wVQrGcXLt65xTpQTnLFQ&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=by79LP_Z_3z5lGgSOusoP29hdhc&cd=i",
                    isLocked: true
                ),
                onTap: {}
            )
            .frame(width: 250)
        }
        .padding()
        .background(GradientTokens.backgroundGradient)
        .previewLayout(.sizeThatFits)
    }
}
