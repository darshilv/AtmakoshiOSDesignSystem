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
    private let image: UIImage?
    private let side: String?
    
    public init(title: String, subTitle: String?, pillText: String?, image: UIImage?, side: String? = nil) {
        self.image = image
        self.title = title
        self.subTitle = subTitle
        self.side = side
        self.pillText = pillText
    }
    // MARK: - Body
    public var body: some View {
        HStack(spacing: 16) {
            // Left side - Pose image
            poseImageView
                .scaledToFit()
            
            // Right side - Pose details
            poseDetailsView
        }
        
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .frame(height: 120)
        
    }
    
    // MARK: - Components
    
    private var poseImageView: some View {
        ZStack {
            Rectangle()
                .fill(GradientTokens.backgroundGradient)
                .frame(width: 100)
                
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //.frame(width: 100, height: 100)
                    //.clipShape(RoundedRectangle(cornerRadius: 10))
            } else{
                PlaceholderImage
            }
        }
    } 
    
    
    private var poseDetailsView: some View {
        HStack {
            // Name and Sanskrit name
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(ColorTokens.Semantic.textPrimary)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    
                
                if !subTitle!.isEmpty {
                    Text(subTitle!)
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(ColorTokens.Semantic.textPrimary)
                        .truncationMode(.tail)
                        .lineLimit(1)
                }
                
                if let side = side {
                       Text(side)
                           .font(.subheadline)
                           .fontWeight(.regular)
                           .foregroundColor(ColorTokens.Semantic.textPrimary)
                   }
                           
            }
            Spacer()
            
            // Duration pill
            
            if !pillText!.isEmpty{
                HStack(spacing:2) {
                   Image(systemName: "clock")
                       .foregroundColor(ColorTokens.Teal.teal800)
                   
                    Text(pillText ?? "")
                           .font(.callout)
                           .foregroundColor(ColorTokens.Teal.teal800)
               }
               .padding(.trailing, 16)
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
                pillText: "60s",
                image: nil
            );
            
            PoseCard(
                title: "Downward Facing Dog",
                subTitle: "Adho Mukha Svanasana",
                pillText: "45s",
                image: nil,
                side: "side1"
            );
        }
        .padding()
        .background(GradientTokens.backgroundGradient)
       // .previewLayout(.sizeThatFits)
    }
}
