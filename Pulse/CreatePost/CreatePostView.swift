//
//  CreatePostView.swift
//  Pulse
//
//  Created by Phuong Ngo on 5/4/22.
//

import SwiftUI

struct CreatePostView: View {
    @EnvironmentObject var viewModel: DataModel
    
    @State private var titleText: String = ""
    @State private var description: String = ""
    @State private var careerAdviceStatus: Bool = false
    @State private var mentalHealthStatus: Bool = false
    @State private var personalStatus: Bool = false
    @State private var relationshipStatus: Bool = false
    @State private var schoolworkStatus: Bool = false
    @State private var otherStatus: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Create a new post")
                .modifier(SailecFont(.medium, size: 18)).foregroundColor(Color.text_primary_color)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .lineSpacing(8)
            TextField(
                "Add a title...",
                text: $titleText
            )
                .modifier(SailecFont(.medium, size: 18))
                .padding(.top, 16)
                .padding(.horizontal, 16)
            Divider()
             .frame(height: 1)
            
            TextField(
                "Add some details...",
                text: $description
            )
                .frame(width: 300)
                .lineLimit(6)
                .modifier(SailecFont(.regular, size: 12))
                .foregroundColor(Color.text_primary_color)
                .fixedSize()
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
                .lineSpacing(5)
                .opacity(0.5)
            Spacer()
            Button(action: {viewModel.addPost(title: titleText, description: description)
                    }){
                        Text("Create a Post")
                            .modifier(SailecFont(.medium, size: 18)).foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.text_primary_color)
                            .clipShape(Capsule())
                    }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
