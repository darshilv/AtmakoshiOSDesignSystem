
import SwiftUI


// MARK: - Sequence Card Component
public struct SequenceCard: View {
    // Data model for the card - using the existing model from your code
    private let cardImageURL: String
    private let cardTitle: String
    private let cardSubtitle: String?
    private let cardIsLocked: Bool?
    private let duration: String?
    private let difficulty: String?
    private let loadImage: ((String, @escaping (UIImage?) -> Void) -> Void)?
//    @State private var cardImage: UIImage?
    
    public init(cardImageURL: String, cardTitle: String, cardSubtitle: String?, cardIsLocked: Bool?, duration: String?, difficulty: String?) {
        self.cardImageURL = cardImageURL
        self.cardTitle = cardTitle
        self.cardSubtitle = cardSubtitle
        self.cardIsLocked = cardIsLocked ?? true
        self.duration = duration
        self.difficulty = difficulty
        self.loadImage = nil
    }
    
    public init(
        cardImageURL: String,
        cardTitle: String,
        cardSubtitle: String?,
        cardIsLocked: Bool?,
        duration: String?,
        difficulty: String?,
        loadImage: @escaping (String, @escaping (UIImage?) -> Void) -> Void
    ) {
        self.cardImageURL = cardImageURL
        self.cardTitle = cardTitle
        self.cardSubtitle = cardSubtitle
        self.cardIsLocked = cardIsLocked ?? true
        self.duration = duration
        self.difficulty = difficulty
        self.loadImage = loadImage
    }
    
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            // Image section
            ZStack(alignment: .topTrailing) {
                atmakoshImage(imageURL : cardImageURL, loadImage: loadImage!)
                
                // Lock icon if sequence is locked
                if cardIsLocked! {
                    LockIconView()
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
    
}
// MARK: - Preview
struct SequenceCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: SpacingTokens.lg) {
            // Regular card
            SequenceCard(
                cardImageURL: "",
                cardTitle: "Morning Flow",
                cardSubtitle: "Gentle awakening, stretching",
                cardIsLocked: false,
                duration: "20sec",
                difficulty: "Beginner"
                //                    focus: "Core, Flexibility",
            );
            
            
            
            HStack(){
                SequenceCard(
                    cardImageURL: "",
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
