//
//  CardsView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        ZStack {
            CardsListView()
            
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
    }
}

#Preview {
    CardsView()
        .environmentObject(ViewState())
}
