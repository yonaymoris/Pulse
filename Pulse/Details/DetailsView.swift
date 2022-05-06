//
//  DetailsView.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject var viewModel: DataModel
    @State private var commentText: String = ""
    
    var id: Int
    
    var body: some View {
        VStack {
            ScrollViewReader { position in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading, spacing: 18) {
                                HStack {
                                    ForEach(viewModel.findPost(by: id)!.tags) { tag in
                                        self.tagView(tag: tag)
                                    }
                                }
                                Text(viewModel.findPost(by: id)!.title).modifier(SailecFont(.medium, size: 20)).foregroundColor(Color.text_primary_color)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(8)
                                Text(viewModel.findPost(by: id)!.description).modifier(SailecFont(.regular, size: 14))
                                    .foregroundColor(Color.text_primary_color)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(5)
                                    .opacity(0.5)
                                HStack {
                                    Text(viewModel.findPost(by: id)!.school)
                                        .modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color)
                                    Text(viewModel.findPost(by: id)!.author)
                                        .modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color)
                                }
                                Spacer()
                                HStack(alignment: .top) {
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .resizable()
                                        .frame(width: 12, height: 10)
                                        .foregroundColor(Color.text_primary_color)
                                    Text(String(viewModel.findPost(by: id)!.upvotes))
                                        .modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                    
                                    Image(systemName: "message.fill")
                                        .resizable()
                                        .frame(width: 12, height: 10)
                                        .foregroundColor(Color.text_primary_color)
                                    Text(String(viewModel.findPost(by: id)!.comments.count))
                                        .modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color)
                                    Spacer()
                                    
                                    Image(systemName: "eye.fill")
                                        .resizable()
                                        .frame(width: 12, height: 10)
                                        .foregroundColor(Color.text_primary_color)
                                    Text(String(viewModel.findPost(by: id)!.views))
                                        .modifier(SailecFont(.regular, size: 14))
                                        .foregroundColor(Color.text_primary_color)
                                    Divider()
                                    Text("Yesterday")
                                        .modifier(SailecFont(.regular, size: 12))
                                        .foregroundColor(Color.text_primary_color)
                                }
                                .opacity(0.5)
                            }
                        }.padding(.horizontal, 24)
                        Spacer()
                        Divider()
                            .padding(.vertical, 35)
                        Spacer()
                        
                        HStack {
                            Text("Comments").modifier(SailecFont(.bold, size: 18))
                                .foregroundColor(Color.text_primary_color)
                                .padding(.bottom, 16)
                            Text(String(viewModel.findPost(by: id)!.comments.count)).modifier(SailecFont(.regular, size: 18))
                                .opacity(0.5)
                                .foregroundColor(Color.text_primary_color)
                                .padding(.bottom, 16)
                        }
                        .padding(.horizontal, 24)
                        VStack(alignment: .leading, spacing: 36) {
                            ForEach(viewModel.findPost(by: id)!.comments) { comment in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(comment.sender)
                                        .modifier(SailecFont(.bold, size: 14))
                                        .foregroundColor(Color.text_primary_color)
                                        .padding(.horizontal, 16)
                                    Text(comment.text)
                                        .foregroundColor(Color.text_primary_color)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .modifier(SailecFont(.regular, size: 14))
                                        .padding(16)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .onChange(of: viewModel.findPost(by: id)!.comments.count) { _ in
                    position.scrollTo(viewModel.requestList[id].comments.last?.id) // it doesn't work :(
                }
            }
            Divider()
            HStack {
                TextField(
                    "Write a comment...",
                    text: $commentText
                )
                    .modifier(SailecFont(.regular, size: 14))
                    .padding(16)
                Button("Send", action: {
                    viewModel.addComment(at: id, text: commentText, sender: viewModel.currentUser.nickname)
                    commentText = ""
                })
            }
            .padding(.horizontal, 16)
        }
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailsView(id: 0)
        }
    }
}
