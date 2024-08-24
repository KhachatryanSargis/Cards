//
//  CardDetailView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @State private var currentModal: CardModal?
        
    var body: some View {
        content
            .modifier(CardToolBar(currentModal: $currentModal))
    }
    
    var content: some View {
        ZStack {
            Group {
                Capsule()
                    .foregroundStyle(Color.yellow)
                Text("Resize Me!")
                    .fontWeight(.bold)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
            .resizableView()
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }
    }
}

#Preview {
    CardDetailView()
        .environmentObject(ViewState())
}
