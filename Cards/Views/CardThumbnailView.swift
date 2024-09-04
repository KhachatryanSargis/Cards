//
//  CardThumbnailView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardThumbnailView: View {
    let card: Card
    var size: CGSize = .zero
    
    var body: some View {
        Group {
            if let uiImage = UIImage.load(uuidString: card.id.uuidString) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                card.backgroundColor
            }
        }
        .clipShape(
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        )
        .frame(
            width: Settings.thumbnailSize(size: size).width,
            height: Settings.thumbnailSize(size: size).height
        )
        .shadow(
            color: Color("shadow-color"),
            radius: 3,
            x: 0,
            y: 0
        )
    }
}

#Preview {
    CardThumbnailView(card: initialCards[0])
}
