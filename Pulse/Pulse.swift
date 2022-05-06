//
//  Pulse.swift
//  Pulse
//
//  Created by Sameer Nawaz on 02/03/21.
//

import SwiftUI

@main
struct Pulse: App {
    
    @StateObject var viewRouter = ViewRouter()
    @StateObject var viewModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environmentObject(viewModel)
        }
    }
}

// environment object is available for any view
