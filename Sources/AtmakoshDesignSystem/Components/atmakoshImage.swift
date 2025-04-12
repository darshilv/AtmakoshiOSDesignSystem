//
//  atmakoshImage.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/11/25.
//

import SwiftUI

public struct atmakoshImage: View {
    private let imageURL: String
    
    public init(imageURL: String) {
        self.imageURL = imageURL
    }
    public var body: some View {
        if let url = URL(string: imageURL) {
            if #available(macOS 12.0, *) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 180)
                    } else if phase.error != nil {
                        PlaceholderImage
                    } else {
                        PlaceholderImage
                    }
                }
                .clipped()
            }
            else {
                // Fallback on earlier versions
                PlaceholderImage
            }
        } else {
                PlaceholderImage
        }
    }
}

