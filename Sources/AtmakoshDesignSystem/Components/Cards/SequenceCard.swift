
import SwiftUI


// MARK: - Sequence Card Component
public struct SequenceCard: View {
    // Data model for the card - using the existing model from your code
    private let cardImageURL: String
    private let cardTitle: String
    private let cardSubtitle: String?
    private let cardIsLocked: Bool = false
    private let duration: String?
    private let difficulty: String?
    
    
    public init(cardImageURL: String, cardTitle: String, cardSubtitle: String?, cardIsLocked: Bool?, duration: String?, difficulty: String?) {
        self.cardImageURL = cardImageURL
        self.cardTitle = cardTitle
        self.cardSubtitle = cardSubtitle
        self.duration = duration
        self.difficulty = difficulty
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            // Image section
            ZStack(alignment: .topTrailing) {
                atmakoshImage(imageURL : cardImageURL)
                
                // Lock icon if sequence is locked
                if cardIsLocked {
                    LockIcon()
                }
            }
            
            VStack(alignment: .leading, spacing: SpacingTokens.xs) {
                Text(cardTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(ColorTokens.Semantic.textPrimary)
                    .lineLimit(1)
                    .padding(.top, SpacingTokens.xs)
                HStack(spacing: SpacingTokens.sm) {
                    if !duration!.isEmpty {
                        HStack(spacing: SpacingTokens.xxs) {
                            Image(systemName: "clock")
                                .font(.callout)
                                .foregroundColor(ColorTokens.Teal.teal900)
                            //creating the string on the fly for now
                            Text(duration ?? "")
                                .font(.callout)
                                .foregroundColor(ColorTokens.Teal.teal900 )
                        }
                        // Separator
                        Text("•")
                            .foregroundColor(ColorTokens.Teal.teal900)
                            .font(.body)
                        HStack(spacing: SpacingTokens.xxs) {
                            Image(systemName: "figure.walk")
                                .font(.callout)
                                .foregroundColor(ColorTokens.Teal.teal900)
                            Text(difficulty ?? "")
                                .font(.callout)
                                .foregroundColor( ColorTokens.Teal.teal900)
                        }
                    }
                }
                .padding(.vertical, SpacingTokens.xxs)
                
            }
            .padding(.horizontal, SpacingTokens.md)
            .background(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.white)
        .cornerRadius(RadiusTokens.xl)
        .applyShadow(ShadowTokens.md)
    }
    
    
    
    
    
    
    
    // MARK: - Preview
    struct SequenceCard_Previews: PreviewProvider {
        static var previews: some View {
            VStack(spacing: SpacingTokens.lg) {
                // Regular card
                SequenceCard(
                    cardImageURL: "https://cvws.icloud-content.com/B/AWiwDwZMsT33M33zClhC8wc7CKY1ASXKf4M-QEm4J0DOzJEsulpprIoD/generate-an-illustration-of-a-yogi-in-king-pigeon-.png?o=AjVsV43PHn15koLps9PtrK2diiBxsLNSJJqcxoB9H7XU&v=1&x=3&a=CAogEwazpksVHHGr12_NYXN9tekeM71eXvb_cpfZgFtBt7YSbRC2j9mD4jIYtuy0heIyIgEAUgQ7CKY1WgRprIoDaibc6urEHPK3CiIdnmlCcebDgh4RgcJEj5ndqSP9KtUzYYfAYntjQHIm7tK6L4drKVzew3CA0YrdeZsIL29SA0PFX-Bh6PeMlyZaBm-Go28&e=1744304944&fl=&r=b940dec7-a93e-4e4d-acdf-7063f6d18d2b-1&k=67xpCKA8wAMbqeKv3Gh7sw&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=76xuLSzbgbviO3eaAlYNpUmATK8&cd=i",
                    cardTitle: "Morning Flow",
                    cardSubtitle: "Gentle awakening, stretching",
                    cardIsLocked: false,
                    duration: "20sec",
                    difficulty: "Beginner"
                    //                    focus: "Core, Flexibility",
                );
                
                
                
                HStack(){
                    SequenceCard(
                        cardImageURL: "https://cvws.icloud-content.com/B/AXOn2XaKZFVh4G0le-3bkewIHzdsARM5F618u0DBaK50PRdB-o9nE3m3/generate-an-illustration-of-a-yogi-in-camel-pose-w.png?o=AowaE8whIcurxBT6viggaCCK62Fe1w8iI1_hS5HGxJcS&v=1&x=3&a=CAoggnGpOhgqiFmbxtbnh8wk6yLJX2cc8pjnkJjc6X2zvt8SbRCcjNqD4jIYnOm1heIyIgEAUgQIHzdsWgRnE3m3aib0lKlF5-1n-6tKO482RTOL1QdgsZVg_m_8a9qFf4NYgwi2HOnP2nIm-Wg_mNrIGluS4kVhXQJmHaXcYG-DqFsiITLN4JH5dC8WTatMjHU&e=1744304960&fl=&r=1011d22d-8676-45ea-b7f2-9e6fe889a5e6-1&k=d4wVQrGcXLt65xTpQTnLFQ&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=by79LP_Z_3z5lGgSOusoP29hdhc&cd=i",
                        
                        cardTitle: "Lower Back Relief",
                        cardSubtitle: "lower back, core",
                        cardIsLocked: true,
                        duration: "30sec",
                        difficulty: "Intermediate"
                        //                    focus: "Lower Back,Core",xs
                    );
                }.padding(SpacingTokens.xxxl)
                // Mini card
                
            }
            .padding()
            .background(GradientTokens.backgroundGradient)
            .previewLayout(.sizeThatFits)
        }
    }
}
