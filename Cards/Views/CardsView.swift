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
            CardsListView()
            VStack {
                Spacer()
                createButton
            }
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
        .background {
            Color("background")
                .ignoresSafeArea()
        }
    }
    
    var createButton: some View {
        Button(action: {
            viewState.selectedCard = store.addCard()
            viewState.showAllCards = false
        }) {
            Label("Create New", systemImage: "plus")
                .frame(maxWidth: .infinity)
        }
        .font(.system(size: 16, weight: .bold))
        .padding([.top, .bottom], 10)
        .background(
            Color("barColor")
                .safeAreaPadding(.vertical, 0)
            /*
             safeAreaPadding(.vertical, 0)
             fixes the safe area issue
             investigate why that happens
             */
        )
        .tint(.white)
    }
}

#Preview {
    CardsView()
        .environmentObject(ViewState())
        .environmentObject(CardStore(defaultData: true))
}
