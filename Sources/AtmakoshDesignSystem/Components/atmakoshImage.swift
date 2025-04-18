//
//  atmakoshImage.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/11/25.
//

import SwiftUI

public struct atmakoshImage: View {
    private let image: UIImage?
    private let imageURL: String?
    private let loadImage: ((String, @escaping (UIImage?) -> Void) -> Void)?
        
    // Init with already loaded image
    public init(image: UIImage) {
        self.image = image
        self.imageURL = nil
        self.loadImage = nil
    }
    
    // Init with URL and image loader function
    public init(imageURL: String, loadImage: @escaping (String, @escaping (UIImage?) -> Void) -> Void) {
        self.image = nil
        self.imageURL = imageURL
        self.loadImage = loadImage
    }
    
    public var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else if let imageURL = imageURL, let loadImage = loadImage {
            Image(systemName: "photo") // Placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    loadImage(imageURL) { loadedImage in
                        // Update image
                    }
                }
        }
    }
}

