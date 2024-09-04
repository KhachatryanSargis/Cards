//
//  CardToolBar.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct CardToolBar: ViewModifier {
    @EnvironmentObject var viewState: ViewState
    @Binding var currentModal: CardModal?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation {
                            viewState.showAllCards = true
                        }
                    }) {
                        Text("Done")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    CardBottomToolbar(cardModel: $currentModal)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        viewState.shouldScreenshot = true
                        currentModal = .shareSheet
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
    }
}
