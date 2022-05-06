//
//  MyPostsView.swift
//  Pulse
//
//  Created by Phuong Ngo on 5/4/22.
//

import SwiftUI

struct MyPostsView: View {
    
    @EnvironmentObject var viewModel: DataModel
    @State var showPages = [false, false, false, false, false, false] // temporary..
    
    var body: some View {
        //        NavigationView {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.getUsersPosts(by: viewModel.currentUser.posts)[0]) { model in
                        NavigationLink(destination: DetailsView(id: model.id), isActive: $showPages[model.id]) {
                            EmptyView()
                        }
                        Button(action: {
                            viewModel.addViews(at: model.id)
                            showPages[model.id].toggle()
                        }, label: {
                            CardView(model: viewModel, id: model.id, tags: model.tags, title: model.title, description: model.description, school: model.school, author: model.author, upvotes: model.upvotes, commentsAmount: model.comments.count, views: model.views, date: model.date)
                                .padding(.bottom, 20)
                                .padding(.horizontal, 16)
                                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 0)
                        })
                    }
                    
                    Text("Archived").modifier(SailecFont(.bold, size: 18))
                        .foregroundColor(Color.text_primary_color)
                        .padding(.bottom, 16)
                        .padding(.top, 65)
                        .padding(.horizontal, 24)
                    
                    ForEach(viewModel.getUsersPosts(by: viewModel.currentUser.posts)[1]) { model in
                        NavigationLink(destination: DetailsView(id: model.id), isActive: $showPages[model.id]) {
                            EmptyView()
                        }
                        Button(action: {
                            viewModel.addViews(at: model.id)
                            showPages[model.id].toggle()
                        }, label: {
                            CardView(model: viewModel, id: model.id, tags: model.tags, title: model.title, description: model.description, school: model.school, author: model.author, upvotes: model.upvotes, commentsAmount: model.comments.count, views: model.views, date: model.date)
                                .padding(.bottom, 20)
                                .padding(.horizontal, 16)
                                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 0)
                        })
                    }
                }
                .padding(.top, 65)
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.bottom, .top])
            .background(Color.primary_color)
        }
    }
}

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}
