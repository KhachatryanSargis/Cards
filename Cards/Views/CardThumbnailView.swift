//
//  CardThumbnailView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct CardThumbnailView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.random())
            .frame(
                width: Settings.thumbnailSize.width,
                height: Settings.thumbnailSize.height
            )
    }
}

#Preview {
    CardThumbnailView()
}
