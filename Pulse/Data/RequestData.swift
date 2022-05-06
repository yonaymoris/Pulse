//
//  DogData.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import Foundation

struct RequestData {
    static let requests = [
        RequestModel(isActive: true, id: 0, author: "shortTrousers", school: "NYU", views: 1, tags: [.mentalHealth], title: "I feel like I am in a creative slump", description: "I don't know why, I thought I would have so many ideas for my projects but now I feel like they just don't matter.", upvotes: 34, date: "2022/05/02 13:31", comments: [
            CommentModel(id: 0, sender: "slyNinja", text: "Hang in there buddy!", date: "2022/05/02 13:45"),
            CommentModel(id: 1, sender: "weirdAnon", text: "I agree, I keep working on the projects but I don't like any of them.", date: "2022/05/02 14:55"),
            CommentModel(id: 2, sender: "fourEyes", text: "Maybe you just need a break", date: "2022/05/02 16:03")
        ]),
        RequestModel(isActive: true, id: 1, author: "adorablePuppy", school: "NYU", views: 1, tags: [.schoolwork], title: "Should I sign for pass/fail if I get a bad grade?", description: "I just got a B in on of my Stern classes, should I opt for pass/fail option?", upvotes: 456, date: "2022/05/02 16:30", comments: [
            CommentModel(id: 0, sender: "shortTrousers", text: "Yeah, I did that for one of my Stern classes, imo it's not worth it", date: "2022/05/02 16:45"),
            CommentModel(id: 1, sender: "slyNinja", text: "I think some companies still like seeing at least some GPA in your resume though", date: "2022/05/02 17:41")
        ]),
        RequestModel(isActive: true, id: 2, author: "slyNinja", school: "Columbia", views: 3, tags: [.relationship, .schoolwork], title: "My boyfriend suggested to work on my final, should I accept his help?", description: "My boyfriend suggested to work on my final, should I accept his help? I feel like it might be not right since it is my final project after all...", upvotes: 14, date: "2022/05/03 12:12", comments: [
            CommentModel(id: 0, sender: "adorablePuppy", text: "Wow your boyfriend is so nice...", date: "2022/05/03 13:12"),
            CommentModel(id: 1, sender: "shortTrousers", text: "I would just accept it haha", date: "2022/05/03 14:01"),
            CommentModel(id: 2, sender: "adorablePuppy", text: "And then try to explain what you did in that project...", date: "2022/05/03 15:01"),
            CommentModel(id: 3, sender: "shortTrousers", text: "Well, I would ask him to explain it to me!", date: "2022/05/03 16:55")
        ]),
        RequestModel(isActive: true, id: 3, author: "globalWarming", school: "Princeton", views: 5, tags: [.other], title: "Is there a good student cofeeshop around WSP?", description: "I am visiting NYC and would like to meet new people from other universities as well so am looking for some cofeeshops visited by lots of students.", upvotes: 132, date: "2022/05/03 14:10", comments: []),
        RequestModel(isActive: false, id: 4, author: "globalWarming", school: "NYU", views: 5, tags: [.careerAdvice], title: "Anyone still applying for internships?", description: "I feel like I’m the last one on the earth to start applying this late... Seems like most of the positions are filled up. I’m kinda anxious", upvotes: 2, date: "2022/05/03 14:10", comments: [])
    ]
}
