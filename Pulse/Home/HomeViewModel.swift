//
//  HomeViewModel.swift
//  Wiggles-iOS
//
//  Created by Sameer Nawaz on 02/03/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var requestList = [RequestModel]()
    
    init() { fetchRequestsList() }
    
    func fetchRequestsList() { requestList = RequestData.requests }
    
    func removeElement(at id: Int) {
        for (index, el) in requestList.enumerated(){
            if (el.id == id) {
                requestList.remove(at: index)
                break
            }
        }
    }
}
