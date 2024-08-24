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
            .foregroundColor(.gray)
            .frame(width: 150, height: 250)
    }
}

#Preview {
    CardThumbnailView()
}
