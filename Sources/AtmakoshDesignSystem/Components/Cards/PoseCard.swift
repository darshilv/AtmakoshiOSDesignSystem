//
//  PoseCard.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/10/25.
//

import SwiftUI

    

struct PoseCard: View {
    // MARK: - Properties
    let pose: YogaPose
    
    // MARK: - Body
    var body: some View {
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
    }
    
    // MARK: - Components
    
    private var poseImageView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: 70, height: 70)
            
            
            if let thumbnailURL = pose.thumbnailURL, let url = URL(string: thumbnailURL) {
                if #available(macOS 12.0, *) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            defaultPoseImage
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                //.background(GradientTokens.backgroundGradient)
                               
                        case .failure:
                            defaultPoseImage
                               
                        @unknown default:
                            defaultPoseImage
                               
                        }
                    }
                } else {
                    defaultPoseImage
                }
            } else {
                defaultPoseImage
            }
        }
    } 
    
    private var defaultPoseImage: some View {
        Image(systemName: "figure.yoga")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(16)
            .frame(width: 70, height: 70)
            .foregroundColor(ColorTokens.Teal.teal500)
           // .background(GradientTokens.backgroundGradient)
    }
    
    private var poseDetailsView: some View {
        HStack {
            // Name and Sanskrit name
            VStack(alignment: .leading, spacing: 4) {
                Text(pose.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(ColorTokens.Semantic.textPrimary)
                
                if !pose.sanskritName.isEmpty {
                    Text(pose.sanskritName)
                        .font(.system(size: 14, weight: .regular))
                        .italic()
                        .foregroundColor(ColorTokens.Semantic.textPrimary)
                }
            }
            
            Spacer()
            
            // Duration pill
            Text(formattedDuration(seconds: pose.durationSeconds))
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(ColorTokens.Teal.teal800)
               
        }
    }
    
    // MARK: - Helper Functions
    
    private func formattedDuration(seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        
        if minutes > 0 {
            return "\(minutes):\(String(format: "%02d", remainingSeconds))"
        } else {
            return "\(remainingSeconds)s"
        }
    }
   
}

// MARK: - Preview
struct PoseCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            PoseCard(pose: YogaPose(
                id: "1",
                name: "Mountain Pose",
                sanskritName: "Tadasana",
                durationSeconds: 60,
                thumbnailURL: "https://cvws.icloud-content.com/B/ARfwdBLCvvxLCgt4eesM2zN4v3NfAfpoAd3WSSqitmm0YGfvU8wrBh4u/Easy+seat.png?o=Au6DF9f-83UD1ZUyBoazi7o7vzzO1qPS2obk0DweEbm3&v=1&x=3&a=CAogoWw-KFHlCm2CvkvHB6Co2ntMrhdyw-6lx68hyJiZDbYSbRCB9KWN4jIYgdGBj-IyIgEAUgR4v3NfWgQrBh4uaiafr_MdovVqKqwNZ1_y7XDKV2ok1NkOWWEkWylAqEGysH8GcTdAD3Im02kW1AyFPgielmcxbtoqgzpkMKMVA-t6MojUavUvKihEhaen0eM&e=1744325077&fl=&r=6fffaa31-76cf-4642-a31b-bcbb3e3ca94c-1&k=v1I38riAO_JNl6BrCOuDxQ&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=7RguzMM8JjrLSHB0fQRszfo74UU&cd=i"
            ))
            
            PoseCard(pose: YogaPose(
                id: "2",
                name: "Downward Facing Dog",
                sanskritName: "Adho Mukha Svanasana",
                durationSeconds: 45,
                thumbnailURL: "https://cvws.icloud-content.com/B/ARIkkpNzutQWuH9YGvlJ7i3Qq8_qASrO9WQBN438Rpb4B9-DN5CbOR87/Easy+seated+twist.png?o=ApLo3MGEDQNMjWMtiQnQDAMflTn9eZVJlf03X3D31bDA&v=1&x=3&a=CAogD-LRswJdqe997Ya1caioFT0ydIoV9-6w9AtzysQkXfoSbRCzxaeN4jIYs6KDj-IyIgEAUgTQq8_qWgSbOR87aiaWvJnxhjoD5Oo_Q5kv3LPFtPHPSvebrywwmdiT_AMLgUKLbP5VsHImur-JhT0yynFWdYNv8wcp7kTd5bg37Pc5Qb6OPoFzZSKq7RHvO3w&e=1744325103&fl=&r=2cdce80d-db15-4f1b-9401-0e72ead39ed3-1&k=YhY30bqyT6md42sWscKg9Q&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=RPOxIR1-Lge5VHliGy5IzSPoSlc&cd=i"
            ))
        }
        .padding()
        .background(GradientTokens.backgroundGradient)
        .previewLayout(.sizeThatFits)
    }
}
