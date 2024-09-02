//
//  CardDetailView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @Environment(\.scenePhase) private var scenePhase
    @State private var currentModal: CardModal?
    @State private var stickerImage: UIImage?
    @State private var images: [UIImage] = []
    @State private var frame: AnyShape?
    @State private var textElement = TextElement()
    @Binding var card: Card
    
    var body: some View {
        content
            .onDrop(of: [.image], delegate: CardDrop(card: $card))
            .modifier(CardToolBar(currentModal: $currentModal))
            .sheet(item: $currentModal) { item in
                switch item {
                case .stickerPicker:
                    StickerPicker(stickerImage: $stickerImage)
                        .onDisappear {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                case .photoPicker:
                    PhotoPicker(images: $images)
                        .onDisappear {
                            for image in images {
                                card.addElement(uiImage: image)
                            }
                            images = []
                        }
                case .framePicker:
                    FramePicker(frame: $frame)
                        .onDisappear {
                            if let frame = frame {
                                card.update(viewState.selectedElement, frame: frame)
                            }
                            frame = nil
                        }
                case .textPicker:
                    TextPicker(textElement: $textElement)
                        .onDisappear {
                            if !textElement.text.isEmpty {
                                card.addElement(textElement)
                            }
                            textElement.text = ""
                        }
                }
            }
            .onChange(of: scenePhase, { _, newValue in
                if newValue == .inactive {
                    card.save()
                }
            })
            .onDisappear {
                card.save()
            }
    }
    
    var content: some View {
        ZStack {
            card.backgroundColor
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    viewState.selectedElement = nil
                }
            ForEach(card.elements, id: \.id) { element in
                CardElementView(
                    element: element,
                    selected: viewState.selectedElement?.id == element.id
                )
                .contextMenu {
                    Button(action: { card.remove(element) }) {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .resizableView(transform: bindingTransform(for: element))
                .frame(
                    width: element.transform.size.width,
                    height: element.transform.size.height
                )
                .onTapGesture {
                    viewState.selectedElement = element
                }
            }
        }
    }
    
    func bindingTransform(for element: CardElement) -> Binding<Transform> {
        guard let index = element.index(in: card.elements) else {
            fatalError("Element does not exist")
        }
        return $card.elements[index].transform
    }
}

#Preview {
    @State var card = initialCards[0]
    
    return CardDetailView(card: $card)
        .environmentObject(ViewState(card: card))
}
