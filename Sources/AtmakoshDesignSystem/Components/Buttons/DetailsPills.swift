//
//  DetailsPills.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/10/25.
//

import SwiftUI

struct PillView: View {
    enum PillType {
        case duration
        case level
        case custom(systemName: String)
    }
    
    let text: String
    let type: PillType
    let backgroundColor: Color
    let textColor: Color
    
    init(text: String, type: PillType, backgroundColor: Color = Color(.white), textColor: Color = ColorTokens.Teal.teal900) {
        self.text = text
        self.type = type
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        HStack(spacing: 4) {
            // Icon based on pill type
            icon
                .font(.system(size: 14))
                .foregroundColor(textColor)
            Text(text)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(textColor)
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
        )
    }
    
    @ViewBuilder
    private var icon: some View {
        switch type {
        case .duration:
            Image(systemName: "clock")
        case .level:
            Image(systemName: "chart.bar.fill")
        case .custom(let systemName):
            Image(systemName: systemName)
        }
    }
}

struct PillView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // Duration pill
            PillView(
                text: "15 mins",
                type: .duration,
                backgroundColor: Color(.white),
                textColor: Color(ColorTokens.Teal.teal900)
            )
            
            // Level pill
            PillView(
                text: "Intermediate",
                type: .level,
                backgroundColor: Color(.white),
                textColor: Color(ColorTokens.Teal.teal900)
            )
            
            // Custom pill
            PillView(
                text: "Core, Balance",
                type: .custom(systemName: "figure.yoga"),
                backgroundColor: Color(.white),
                textColor: Color(ColorTokens.Teal.teal900)
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
        .background(GradientTokens.backgroundGradient)
        
        // Responsive layout preview with multiple pills in a flow layout
        VStack(alignment: .leading) {
            Text("Yoga Session Details")
                .font(.headline)
            
            FlexibleRowView(
                items: [
                    AnyView(PillView(text: "25 mins", type: .duration, backgroundColor: .white, textColor: ColorTokens.Teal.teal900)),
                    AnyView(PillView(text: "Intermediate", type: .level, backgroundColor: .purple.opacity(0.2), textColor: .purple)),
                    AnyView(PillView(text: "Core, Balance", type: .custom(systemName: "figure.yoga"), backgroundColor: .green.opacity(0.2), textColor: .green))
                ],
                spacing: 8,
                rowSpacing: 8
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
        .background(GradientTokens.backgroundGradient)
       
    }
}
    

//flex layout
struct WrapLayout: Layout {
    var horizontalSpacing: CGFloat = 8
    var verticalSpacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let containerWidth = proposal.width ?? .infinity
        
        var height: CGFloat = 0
        var width: CGFloat = 0
        var rowHeight: CGFloat = 0
        var rowWidth: CGFloat = 0
        
        for view in subviews {
            let viewSize = view.sizeThatFits(.unspecified)
            
            if rowWidth + viewSize.width > containerWidth && rowWidth > 0 {
                // Start a new row
                width = max(width, rowWidth)
                height += rowHeight + verticalSpacing
                rowWidth = viewSize.width
                rowHeight = viewSize.height
            } else {
                // Add to current row
                rowWidth += viewSize.width + (rowWidth > 0 ? horizontalSpacing : 0)
                rowHeight = max(rowHeight, viewSize.height)
            }
        }
        
        // Account for the last row
        height += rowHeight
        width = max(width, rowWidth)
        
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let containerWidth = bounds.width
        
        var rowX: CGFloat = bounds.minX
        var rowY: CGFloat = bounds.minY
        var rowHeight: CGFloat = 0
        
        for view in subviews {
            let viewSize = view.sizeThatFits(.unspecified)
            
            if rowX + viewSize.width > bounds.maxX && rowX > bounds.minX {
                // Start a new row
                rowX = bounds.minX
                rowY += rowHeight + verticalSpacing
                rowHeight = 0
            }
            
            view.place(
                at: CGPoint(x: rowX, y: rowY),
                proposal: ProposedViewSize(width: viewSize.width, height: viewSize.height)
            )
            
            rowX += viewSize.width + horizontalSpacing
            rowHeight = max(rowHeight, viewSize.height)
        }
    }
}

// Usage
struct FlexibleRowView: View {
    let items: [AnyView]
    let spacing: CGFloat
    let rowSpacing: CGFloat
    
    var body: some View {
        WrapLayout(horizontalSpacing: spacing, verticalSpacing: rowSpacing) {
            ForEach(0..<items.count, id: \.self) { index in
                items[index]
            }
        }
    }
}
