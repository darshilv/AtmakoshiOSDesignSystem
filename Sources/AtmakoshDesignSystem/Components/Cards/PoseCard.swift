//
//  PoseCard.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/10/25.
//

import SwiftUI

    

public struct PoseCard: View {
    // MARK: - Properties
    private let title : String
    private let subTitle : String?
    private let pillText : String?
    private let ImageURL: String
    
    public init(title: String, subTitle: String?, pillText: String?, ImageURL: String) {
        self.ImageURL = ImageURL
        self.title = title
        self.subTitle = subTitle
        self.pillText = pillText
    }
    // MARK: - Body
    public var body: some View {
        HStack(spacing: 16) {
            // Left side - Pose image
            poseImageView
            
            // Right side - Pose details
            poseDetailsView
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .frame(height: 120)
        
    }
    
    // MARK: - Components
    
    private var poseImageView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(GradientTokens.backgroundGradient)
                .frame(width: 100, height: 100)
                
            
            
            if let url = URL(string: ImageURL) {
                if #available(macOS 12.0, *) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            PlaceholderImage
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                //.frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                //.background(GradientTokens.backgroundGradient)
                               
                        case .failure:
                            PlaceholderImage
                               
                        @unknown default:
                            PlaceholderImage
                               
                        }
                    }
                } else {
                    PlaceholderImage
                }
            } else {
                PlaceholderImage
            }
        }
    } 
    
    
    private var poseDetailsView: some View {
        HStack {
            // Name and Sanskrit name
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(ColorTokens.Semantic.textPrimary)
                
                if !subTitle!.isEmpty {
                    Text(subTitle!)
                        .font(.system(size: 14, weight: .regular))
                        .italic()
                        .foregroundColor(ColorTokens.Semantic.textPrimary)
                }
            }
            
            Spacer()
            
            // Duration pill
            if !pillText!.isEmpty{
                Text(pillText ?? "")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(ColorTokens.Teal.teal800)
            }
               
        }
    }

   
}

// MARK: - Preview
struct PoseCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            PoseCard(
                title: "Mountain Pose",
                subTitle: "Tadasana",
                pillText: "60sec",
                ImageURL: "https://cvws.icloud-content.com/B/ARfwdBLCvvxLCgt4eesM2zN4v3NfAfpoAd3WSSqitmm0YGfvU8wrBh4u/Easy+seat.png?o=Au6DF9f-83UD1ZUyBoazi7o7vzzO1qPS2obk0DweEbm3&v=1&x=3&a=CAogoWw-KFHlCm2CvkvHB6Co2ntMrhdyw-6lx68hyJiZDbYSbRCB9KWN4jIYgdGBj-IyIgEAUgR4v3NfWgQrBh4uaiafr_MdovVqKqwNZ1_y7XDKV2ok1NkOWWEkWylAqEGysH8GcTdAD3Im02kW1AyFPgielmcxbtoqgzpkMKMVA-t6MojUavUvKihEhaen0eM&e=1744325077&fl=&r=6fffaa31-76cf-4642-a31b-bcbb3e3ca94c-1&k=v1I38riAO_JNl6BrCOuDxQ&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=7RguzMM8JjrLSHB0fQRszfo74UU&cd=i"
            );
            
            PoseCard(
                title: "Downward Facing Dog",
                subTitle: "Adho Mukha Svanasana",
                pillText: "45sec",
                ImageURL: "https://cvws.icloud-content.com/B/ARIkkpNzutQWuH9YGvlJ7i3Qq8_qASrO9WQBN438Rpb4B9-DN5CbOR87/Easy+seated+twist.png?o=ApLo3MGEDQNMjWMtiQnQDAMflTn9eZVJlf03X3D31bDA&v=1&x=3&a=CAogD-LRswJdqe997Ya1caioFT0ydIoV9-6w9AtzysQkXfoSbRCzxaeN4jIYs6KDj-IyIgEAUgTQq8_qWgSbOR87aiaWvJnxhjoD5Oo_Q5kv3LPFtPHPSvebrywwmdiT_AMLgUKLbP5VsHImur-JhT0yynFWdYNv8wcp7kTd5bg37Pc5Qb6OPoFzZSKq7RHvO3w&e=1744325103&fl=&r=2cdce80d-db15-4f1b-9401-0e72ead39ed3-1&k=YhY30bqyT6md42sWscKg9Q&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=RPOxIR1-Lge5VHliGy5IzSPoSlc&cd=i"
            );
        }
        .padding()
        .background(GradientTokens.backgroundGradient)
       // .previewLayout(.sizeThatFits)
    }
}
