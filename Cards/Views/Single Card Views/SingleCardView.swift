//
//  SingleCardView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        NavigationStack {
            CardDetailView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SingleCardView()
        .environmentObject(ViewState())
}
