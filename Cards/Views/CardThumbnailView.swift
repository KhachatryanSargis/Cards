//
//  CardThumbnailView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardThumbnailView: View {
    let card: Card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(card.backgroundColor)
            .frame(
                width: Settings.thumbnailSize.width,
                height: Settings.thumbnailSize.height
            )
    }
}

#Preview {
    CardThumbnailView(card: initialCards[0])
}
