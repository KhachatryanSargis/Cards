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
    @StateObject var store = CardStore()
    
    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(viewState)
                .environmentObject(store)
        }
    }
}
