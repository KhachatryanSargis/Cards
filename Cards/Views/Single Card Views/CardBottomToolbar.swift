//
//  CardBottomToolbar.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct ToolbarButtonView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
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
            if verticalSizeClass == .compact {
                compactView(imageName)
            } else {
                regularView(imageName, text: text)
            }
        }
    }

    func regularView(_ imageName: String, text: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
            Text(text)
        }
        .frame(minWidth: 60)
        .padding(.top, 5)
    }

    func compactView(_ imageName: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
        }
        .frame(minWidth: 60)
        .padding(.top, 5)
    }
}

struct CardBottomToolbar: View {
    @EnvironmentObject var viewState: ViewState
    @Binding var cardModel: CardModal?
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button(action: { cardModel = .photoPicker }) {
                ToolbarButtonView(modal: .photoPicker)
            }
            Button(action: { cardModel = .framePicker }) {
                ToolbarButtonView(modal: .framePicker)
            }
            .disabled(
                viewState.selectedElement == nil ||
                !(viewState.selectedElement.self is ImageElement)
            )
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
