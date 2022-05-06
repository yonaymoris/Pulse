//
//  HomeView.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import SwiftUI

struct HomeView: View {
    
    //    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var viewModel: DataModel
    @State var showPages = [false, false, false, false, false, false] // temporary..
    
    var body: some View {
        //        NavigationView {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Most Popular").modifier(SailecFont(.regular, size: 14))
                            .foregroundColor(Color.text_primary_color)
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 12, height: 8)
                            .foregroundColor(Color.text_primary_color)
                    }
                    .padding(.bottom, 8)
                    .padding(.top, 65)
                    .padding(.horizontal, 24)
                    .opacity(0.8)
                    ForEach(viewModel.requestList) { model in
                        if (model.isActive) {
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
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.bottom, .top])
            .background(Color.primary_color)
        }
        //        }
        //        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



