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
                    Button(action: { viewState.showAllCards.toggle() }) {
                        Text("Done")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    CardBottomToolbar(cardModel: $currentModal)
                }
            }
    }
}
