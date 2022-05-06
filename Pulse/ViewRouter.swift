//
//  ViewRouter.swift
//  Wiggles-iOS
//
//  Created by Phuong Ngo on 4/30/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case myPosts
}
