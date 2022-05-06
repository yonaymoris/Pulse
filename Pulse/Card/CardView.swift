//
//  CardView.swift
//  Pulse
//
//  Created by Phuong Ngo on 5/4/22.
//

import SwiftUI

struct CardView: View {
    
    @State private var offset: CGSize = .zero
    @State private var tapped: Bool = false
    
    var removal: (() -> Void)? = nil
    var model: DataModel ,id: Int, tags: [Tags], title: String, description: String, school: String, author: String, upvotes: Int, commentsAmount: Int, views: Int, date: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        ForEach(tags) { tag in
                            self.tagView(tag: tag)
                        }
                    }
                    Text(title).modifier(SailecFont(.medium, size: 18)).foregroundColor(Color.text_primary_color)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                    Text(description).lineLimit(3).modifier(SailecFont(.regular, size: 12))
                        .foregroundColor(Color.text_primary_color)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .opacity(0.5)
                    HStack {
                        Text(school)
                            .modifier(SailecFont(.regular, size: 12))
                            .foregroundColor(Color.text_primary_color)
                        Text(author)
                            .modifier(SailecFont(.regular, size: 12))
                            .foregroundColor(Color.text_primary_color)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "arrowtriangle.up.fill")
                            .resizable()
                            .frame(width: 12, height: 10)
                            .foregroundColor(Color.text_primary_color)
                        Text(String(upvotes))
                            .modifier(SailecFont(.regular, size: 12))
                            .foregroundColor(Color.text_primary_color)
                        Spacer()
                        
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 12, height: 10)
                            .foregroundColor(Color.text_primary_color)
                        Text(String(commentsAmount))
                            .modifier(SailecFont(.regular, size: 12))
                            .foregroundColor(Color.text_primary_color)
                        Spacer()
                        
                        Image(systemName: "eye.fill")
                            .resizable()
                            .frame(width: 12, height: 10)
                            .foregroundColor(Color.text_primary_color)
                        Text(String(views))
                            .modifier(SailecFont(.regular, size: 12))
                            .foregroundColor(Color.text_primary_color)
                        Divider()
                        Text("Yesterday")
                            .modifier(SailecFont(.regular, size: 12))
                            .foregroundColor(Color.text_primary_color)
                    }
                    .opacity(0.5)
                }
            }.padding(.horizontal)
        }
        .padding([.top, .bottom])
        .background(Color.secondary_color)
        .cornerRadius(15)
    }
    
    func textView(text: String, color: Color) -> some View {
        return Text(text)
            .padding(8)
            .background(color)
            .clipShape(Capsule())
            .modifier(SailecFont(.medium, size: 12))
            .foregroundColor(Color.white)
    }
    
    func tagView(tag: Tags) -> some View {
        switch tag {
        case .careerAdvice: return textView(text: "Career Advice", color: Color.blue)
        case .mentalHealth: return textView(text: "Mental Health", color: Color.pink)
        case .personal: return textView(text: "Personal", color: Color.green)
        case .relationship: return textView(text: "Relationship", color: Color.yellow)
        case .schoolwork: return textView(text: "Schoolwork", color: Color.purple)
        case .other: return textView(text: "Other", color: Color.gray)
        }
    }
}

