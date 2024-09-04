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
        VStack(spacing: 8) {
            if viewState.showAllCards {
                ListSelectionView(selection: $viewState.cardListState)
            }
            ZStack {
                switch viewState.cardListState {
                case .list:
                    CardsListView()
                case .carousel:
                    Carousel()
                }
                VStack {
                    Spacer()
                    createButton
                }
                if !viewState.showAllCards {
                    SingleCardView()
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                }
            }
            .background {
                Color("background")
                    .ignoresSafeArea()
            }
        }
    }
    
    var createButton: some View {
        Button(action: {
            viewState.selectedCard = store.addCard()
            withAnimation {
                viewState.showAllCards = false
            }
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
