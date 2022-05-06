//
//  DogModel.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import Foundation
import SwiftUI

enum Tags: String {
    case careerAdvice = "Career Advice", mentalHealth = "Mental Health", personal = "Personal", relationship = "Relationship", schoolwork = "Schoolwork", other = "Other"
}

extension Tags: Identifiable {
    var id: Self { self }
}

struct RequestModel: Identifiable {
    var isActive: Bool
    var id: Int
    var author: String
    var school: String
    var views: Int = 0
    var tags: [Tags]
    var title: String
    var description: String
    var upvotes: Int
    var date: String
    var comments: [CommentModel]
}

struct CommentModel: Identifiable {
    var id: Int
    var sender: String
    var text: String
    var date: String
}

struct UserModel: Identifiable {
    var id: Int
    var nickname: String
    var posts: [Int]
}
