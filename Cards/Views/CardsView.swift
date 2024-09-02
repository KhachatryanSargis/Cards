//
//  CardsView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    viewState.selectedCard = store.addCard()
                    viewState.showAllCards = false
                } label: {
                    Text("Add")
                }
                CardsListView()
            }
            
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
    }
}

#Preview {
    CardsView()
        .environmentObject(ViewState())
        .environmentObject(CardStore(defaultData: true))
}
