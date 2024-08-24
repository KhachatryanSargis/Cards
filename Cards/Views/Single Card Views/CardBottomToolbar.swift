//
//  CardBottomToolbar.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct ToolbarButtonView: View {
    let modal: CardModal
    
    private let modalButton: [CardModal: (text: String, imageName: String)] = [
        .photoPicker: ("Photos", "photo"),
        .framePicker: ("Frames", "square.on.circle"),
        .stickerPicker: ("Stickers", "heart.circle"),
        .textPicker: ("Text", "textformat")
    ]
    
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                Text(text)
            }
            .padding(.top)
        }
    }
}

struct CardBottomToolbar: View {
    @Binding var cardModel: CardModal?
    
    var body: some View {
        HStack {
            Button(action: { cardModel = .photoPicker }) {
                ToolbarButtonView(modal: .photoPicker)
            }
            Button(action: { cardModel = .framePicker }) {
                ToolbarButtonView(modal: .framePicker)
            }
            Button(action: { cardModel = .stickerPicker }) {
                ToolbarButtonView(modal: .stickerPicker)
            }
            Button(action: { cardModel = .textPicker }) {
                ToolbarButtonView(modal: .textPicker)
            }
        }
    }
}

struct CardBottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        CardBottomToolbar(cardModel: .constant(.stickerPicker))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
