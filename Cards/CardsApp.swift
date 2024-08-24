//
//  CardsApp.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

@main
struct CardsApp: App {
    @StateObject var viewState = ViewState()
    
    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(viewState)
        }
    }
}
