//
//  InfoCard.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import SwiftUI

@available(macOS 10.15, *)
public struct InfoCard: View {
    private let title: String
    private let description: String
    private let iconName: String?
    
    public init(title: String, description: String, iconName: String? = nil) {
        self.title = title
        self.description = description
        self.iconName = iconName
    }
    
   // @available(macOS 11.0, *)
    public var body: some View {
        HStack(alignment: .top, spacing: SpacingTokens.sm) {
            if let iconName = iconName {
                if #available(macOS 11.0, *) {
                    Image(systemName: iconName)
                        .foregroundColor(Color.ds.primary)
                }
                else{
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.ds.primary)
                }
            }
            
            VStack(alignment: .leading, spacing: SpacingTokens.xs) {
                Text(title)
                    .font(Font.ds.heading3())
                    .foregroundColor(Color.ds.textPrimary)
                
                Text(description)
                    .font(Font.ds.body())
                    .foregroundColor(Color.ds.textSecondary)
            }
        }
        .padding(SpacingTokens.md)
        .cardStyle()
    }
}

 @available(macOS 11.0, *)
struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard(
            title: "Important Information", 
            description: "This is a description of the important information.",
            iconName: "info.circle"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
