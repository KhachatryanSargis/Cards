//
//  CardsListView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnailView(card: card)
                        .contextMenu {
                            Button(action: { store.remove(card) }) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                            viewState.selectedCard = card
                        }
                }
            }
        }
    }
}

#Preview {
    CardsListView()
        .environmentObject(ViewState())
        .environmentObject(CardStore(defaultData: true))
}
