//
//  SingleCardView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        if let selectedCard = viewState.selectedCard,
           let index = store.index(for: selectedCard) {
            NavigationStack {
                CardDetailView(card: $store.cards[index])
                    .navigationBarTitleDisplayMode(.inline)
                // Without the next line navigationBar and bottomBar and transparent.
                    .toolbarBackground(.visible, for: .navigationBar, .bottomBar)
            }
        }
    }
}

#Preview {
    SingleCardView()
        .environmentObject(ViewState(card: initialCards[0]))
        .environmentObject(CardStore(defaultData: true))
}
