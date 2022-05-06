//
//  HomeViewModel.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import Foundation

class DataModel: ObservableObject {
    
    @Published var requestList = [RequestModel]()
    @Published var currentUser = UserModel(id: 0, nickname: "globalWarming", posts: [3, 4])
    
    init() { fetchRequestsList() }
    
    func fetchRequestsList() {
        requestList = RequestData.requests
    }
    
    func removeElement(at id: Int) {
        for (index, el) in requestList.enumerated(){
            if (el.id == id) {
                requestList.remove(at: index)
                break
            }
        }
    }
    
    func toggleActive(at id: Int) {
        for (index, el) in requestList.enumerated(){
            if (el.id == id) {
                requestList[index].isActive.toggle()
            }
        }
    }
    
    func addViews(at id: Int) {
        for (index, el) in requestList.enumerated(){
            if (el.id == id) {
                requestList[index].views += 1
            }
        }
    }
    
    func addComment(at id: Int, text: String, sender: String) {
        for (index, el) in requestList.enumerated(){
            if (el.id == id) {
                requestList[index].comments.append(CommentModel(id: requestList[index].comments.count, sender: sender, text: text, date: "2022/05/03 16:55"))
            }
        }
    }
    
    func findPost(by id: Int) -> RequestModel? {
        for (index, el) in requestList.enumerated(){
            if (el.id == id) {
                return requestList[index]
            }
        }
        
        return nil
    }
    
    func getUsersPosts(by ids: [Int]) -> [[RequestModel]] {
        var activePosts = [RequestModel]()
        var nonActivePosts = [RequestModel]()
        
        for id in ids {
            if let post = findPost(by: id) {
                if (post.isActive) {
                    activePosts.append(post)
                }
                else {
                    nonActivePosts.append(post)
                }
            }
        }
        
        return [activePosts, nonActivePosts]
    }
    
    func addPost(title: String, description: String) {
        requestList.insert(RequestModel(isActive: true, id: requestList.count, author: currentUser.nickname, school: "NYU", tags: [.other], title: title, description: description, upvotes: 0, date: "2022/05/03 16:55", comments: []), at: 0)
    }
}
