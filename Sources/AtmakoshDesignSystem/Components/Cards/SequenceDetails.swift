//
//  SequenceDetails.swift
//  AtmakoshDesignSystem
//
//  Created by Ashna Kothari on 4/10/25.
//

import SwiftUI

struct SequenceDrawerView: View {
    // MARK: - Properties
    let sequence: YogaSequence
    @State private var isEditingSequence: Bool = false
    @State private var scrollOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var expandedSections: Set<String> = ["1"] // Default expand first section
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Drawer handle
                drawerHandle
                
                // Main content
                VStack(alignment: .leading, spacing: 20) {
                    // Sequence title
                    Text(sequence.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(ColorTokens.Semantic.textPrimary)
                        .padding(.top, 8)
                        
                    
                    // Start practice button
                    startPracticeButton
                    
                    // Details row (duration, level)
                    detailsRow
                    
                    // Equipment, if any
                    if !sequence.equipment.isEmpty {
                        equipmentView
                    }
                    
                    // Description
                    descriptionView
                    
                    // Target areas
                    targetAreasView
                    
                    // Pose list section
                    poseListSection
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(ColorTokens.Semantic.borderMedium)
        .cornerRadius(15)
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isEditingSequence) {
            // This would navigate to your sequence edit view
            Text("Edit Sequence View")
        }
    }
    
    // MARK: - Components
    
    private var drawerHandle: some View {
        VStack {
            Capsule()
                .fill(ColorTokens.Semantic.grabber.opacity(0.5))
                .frame(width: 40, height: 5)
                .padding(.top, 8)
                .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        //.background(ColorTokens.Semantic.grabber)
        .gesture(dragGesture)
    }
    
    private var startPracticeButton: some View {
        PrimaryButton(title: "Start Practice", action: {})
    }
    
    private var detailsRow: some View {
        HStack(spacing: 20) {
          //duration pill
            HStack(spacing: 20) {
                // Duration pill
                PillView(
                    text: "15 mins",
                    type: .duration
                    
                )
                
                // Level pill
                PillView(
                    text: "Intermediate",
                    type: .level,
                    backgroundColor: Color(.white),
                    textColor: Color(ColorTokens.Teal.teal900)
                )
            }
        }
    }
    
    private var equipmentView: some View {
        HStack {
            Image(systemName: "dumbbell")
                .foregroundColor(.gray)
            Text(sequence.equipment)
                .font(.subheadline)
        }
        .padding(.vertical, 8)
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sequence.description)
                .font(.body)
                .lineLimit(6)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    private var targetAreasView: some View {
        HStack {
            Image(systemName: "target")
                .foregroundColor(.gray)
            Text(sequence.focus.joined(separator: ", "))
                .font(.subheadline)
        }
        .padding(.vertical, 8)
    }
    
    private var poseListSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Pose list")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                // Edit button shown only if sequence is editable
                editButton
            }
            
            // Sections and poses
            ForEach(sequence.sections) { section in
                sectionView(section)
            }
        }
    }
    
    private var editButton: some View {
        Group {
            if sequence.isLocked {
                Button(action: {
                    isEditingSequence = true
                }) {
                    HStack {
                        Image(systemName: "lock.open")
                        Text("Edit")
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
            } else {
                HStack {
                    Image(systemName: "lock")
                    Text("Edit")
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.gray)
                .cornerRadius(20)
                .opacity(0.7)
            }
        }
    }
    
    // Inside SequenceDrawerView, update the sectionView function:

    private func sectionView(_ section: YogaSection) -> some View {
        let isExpanded = expandedSections.contains(section.id)
        
        return VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                toggleSection(section.id)
            }) {
                HStack {
                    Text(section.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                        Text("\(section.durationMinutes)min")
                            .foregroundColor(.gray)
                    }
                    .font(.subheadline)
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                VStack(spacing: 8) {
                    ForEach(section.poses) { pose in
                        PoseCard(pose: pose)
                    }
                }
            }
        }
    }
    
    // MARK: - Actions
    
    private func toggleSection(_ sectionId: String) {
        if expandedSections.contains(sectionId) {
            expandedSections.remove(sectionId)
        } else {
            expandedSections.insert(sectionId)
        }
    }
    
    // MARK: - Gestures
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                isDragging = true
                scrollOffset = value.translation.height
            }
            .onEnded { value in
                isDragging = false
                scrollOffset = 0
                
                // Implement drawer behavior logic here if needed
                // e.g., collapse if dragged down a certain amount
            }
    }
}

// MARK: - Supporting Views

struct PoseItemView: View {
    let pose: YogaPose
    
    var body: some View {
        HStack(alignment: .center) {
            // Pose thumbnail
            if let thumbnailURL = pose.thumbnailURL {
                if #available(macOS 12.0, *) {
                    AsyncImage(url: URL(string: thumbnailURL)) { phase in
                        switch phase {
                        case .empty:
                            Image(systemName: "figure.yoga")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        case .failure:
                            Image(systemName: "figure.yoga")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    // Fallback for older macOS versions
                    Image(systemName: "figure.yoga")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                }
            } else {
                Image(systemName: "figure.yoga")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pose.name)
                    .font(.headline)
                
                if !pose.sanskritName.isEmpty {
                    Text(pose.sanskritName)
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            // Duration
            Text(formattedDuration(seconds: pose.durationSeconds))
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(.white)
                .cornerRadius(12)
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
    
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

// MARK: - Helper Extensions

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Preview

struct SequenceDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Preview with editable sequence
            SequenceDrawerView(sequence: sampleSequence)
                .previewDisplayName("Editable Sequence")
            
            // Preview with locked sequence
            SequenceDrawerView(sequence: lockedSequence)
                .previewDisplayName("Locked Sequence")
                .preferredColorScheme(.dark)  // Preview in dark mode
        }
    }
    
    // Sample data for preview
    static var sampleSequence: YogaSequence {
        YogaSequence(
            id: "1",
            name: "Power Flow",
            description: "This dynamic flow begins with centering breath and gentle warm-ups before building intensity through a series of standing postures that challenge balance, such as Warrior III and Half Moon. The sequence then transitions to core work and ends with deep stretches for recovery.",
            duration: 45,
            difficulty: "Advanced",
            focus: ["Back", "Hips"],
            imageUrl: nil,
            isLocked: true
        )
    }
    
    static var lockedSequence: YogaSequence {
        YogaSequence(
            id: "2",
            name: "Premium Power Flow",
            description: "This dynamic flow begins with centering breath and gentle warm-ups before building intensity through a series of standing postures that challenge balance.",
            duration: 30,
            difficulty: "Intermediate",
            focus: ["Core", "Balance"],
            imageUrl: nil,
            isLocked: false
        )
    }
}

// MARK: - Sample Data Models (These would come from your actual model layer)

extension YogaSequence {
    var equipment: String {
        return "{{Equipment}}"
    }
    
    var sections: [YogaSection] {
        return [
            YogaSection(
                id: "1",
                name: "Warm up",
                durationMinutes: 5,
                isExpanded: true,
                poses: [
                    YogaPose(
                        id: "1",
                        name: "Easy Seat",
                        sanskritName: "Sukhasana",
                        durationSeconds: 60,
                        thumbnailURL: "https://cvws.icloud-content.com/B/ARfwdBLCvvxLCgt4eesM2zN4v3NfAfpoAd3WSSqitmm0YGfvU8wrBh4u/Easy+seat.png?o=Au6DF9f-83UD1ZUyBoazi7o7vzzO1qPS2obk0DweEbm3&v=1&x=3&a=CAogoWw-KFHlCm2CvkvHB6Co2ntMrhdyw-6lx68hyJiZDbYSbRCB9KWN4jIYgdGBj-IyIgEAUgR4v3NfWgQrBh4uaiafr_MdovVqKqwNZ1_y7XDKV2ok1NkOWWEkWylAqEGysH8GcTdAD3Im02kW1AyFPgielmcxbtoqgzpkMKMVA-t6MojUavUvKihEhaen0eM&e=1744325077&fl=&r=6fffaa31-76cf-4642-a31b-bcbb3e3ca94c-1&k=v1I38riAO_JNl6BrCOuDxQ&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=7RguzMM8JjrLSHB0fQRszfo74UU&cd=i"
                    ),
                    YogaPose(
                        id: "2",
                        name: "Easy seated twist",
                        sanskritName: "Marjaryasana-Bitilasana",
                        durationSeconds: 45,
                        thumbnailURL: "https://cvws.icloud-content.com/B/ARIkkpNzutQWuH9YGvlJ7i3Qq8_qASrO9WQBN438Rpb4B9-DN5CbOR87/Easy+seated+twist.png?o=ApLo3MGEDQNMjWMtiQnQDAMflTn9eZVJlf03X3D31bDA&v=1&x=3&a=CAogD-LRswJdqe997Ya1caioFT0ydIoV9-6w9AtzysQkXfoSbRCzxaeN4jIYs6KDj-IyIgEAUgTQq8_qWgSbOR87aiaWvJnxhjoD5Oo_Q5kv3LPFtPHPSvebrywwmdiT_AMLgUKLbP5VsHImur-JhT0yynFWdYNv8wcp7kTd5bg37Pc5Qb6OPoFzZSKq7RHvO3w&e=1744325103&fl=&r=2cdce80d-db15-4f1b-9401-0e72ead39ed3-1&k=YhY30bqyT6md42sWscKg9Q&ckc=com.apple.clouddocs&ckz=com.apple.CloudDocs&p=52&s=RPOxIR1-Lge5VHliGy5IzSPoSlc&cd=i"
                    )
                ]
            ),
            YogaSection(
                id: "2",
                name: "Standing Sequence",
                durationMinutes: 25,
                isExpanded: false,
                poses: [
                    YogaPose(
                        id: "3",
                        name: "Mountain Pose",
                        sanskritName: "Tadasana",
                        durationSeconds: 30,
                        thumbnailURL: nil
                    ),
                    YogaPose(
                        id: "4",
                        name: "Warrior II",
                        sanskritName: "Virabhadrasana II",
                        durationSeconds: 60,
                        thumbnailURL: nil
                    )
                ]
            )
        ]
    }
}

struct YogaSection: Identifiable {
    let id: String
    let name: String
    let durationMinutes: Int
    let isExpanded: Bool
    let poses: [YogaPose]
}

struct YogaPose: Identifiable {
    let id: String
    let name: String
    let sanskritName: String
    let durationSeconds: Int
    let thumbnailURL: String?
}
