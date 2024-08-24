//
//  CardsListView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnailView()
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                        }
                }
            }
        }
    }
}

#Preview {
    CardsListView()
        .environmentObject(ViewState())
}
