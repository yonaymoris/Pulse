//
//  ContentView.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @State var bottomSheetPosition: BookBottomSheetPosition = .hidden
    
    let backgroundColors: [Color] = [Color(red: 0.2, green: 0.85, blue: 0.7), Color(red: 0.13, green: 0.55, blue: 0.45)]
    let readMoreColors: [Color] = [Color(red: 0.70, green: 0.22, blue: 0.22), Color(red: 1, green: 0.32, blue: 0.32)]
    let bookmarkColors: [Color] = [Color(red: 0.28, green: 0.28, blue: 0.53), Color(red: 0.44, green: 0.44, blue: 0.83)]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                NavigationView {
                    VStack {
                        switch viewRouter.currentPage {
                        case .home:
                            HomeView()
                        case .myPosts:
                            MyPostsView()
                        }
                        Spacer()
                        ZStack {
                            HStack {
                                TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Feed")
                                Button(action: {
                                    bottomSheetPosition = .tall
                                }, label: {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: geometry.size.width/5, height: geometry.size.width/5)
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width/6-6 , height: geometry.size.width/6-6)
                                            .foregroundColor(Color.text_primary_color)
                                    }
                                    .compositingGroup()
                                    .offset(y: -geometry.size.height/8/3)
                                })
                                TabBarIcon(viewRouter: viewRouter, assignedPage: .myPosts, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "My Posts")
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height/9)
                            .background(Color("TabBarBackground"))
                        }
                        .compositingGroup()
                        .shadow(radius: 2)
                    }
                    .edgesIgnoringSafeArea([.bottom, .top])
                    .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, options: [.noDragIndicator, .background({ AnyView(Color.secondary_color) }), .cornerRadius(15), .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 0), .backgroundBlur(effect: .dark), .showCloseButton(), .swipeToDismiss, .tapToDismiss, .absolutePositionValue] ,headerContent: {}) {
                    VStack(spacing: 0) {
                        CreatePostView()
                        Spacer(minLength: 0)
                    }
                    .padding([.horizontal, .top])

                }
            }
        }
    }
}

enum BookBottomSheetPosition: CGFloat, CaseIterable {
    case tall = 600, bottom = 125, hidden = 0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.text_primary_color)
            //Since we have five icons, we want everyone to be one-fifth of the ContentView's width
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .opacity(viewRouter.currentPage == assignedPage ? 1 : 0.5)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}
