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
    @Binding var card: Card
    
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
                .onDrop(
                    of: [.image],
                    delegate: CardDrop(
                        card: $card,
                        size: proxy.size,
                        frame: proxy.frame(in: .global)
                    )
                )
                .onDrop(of: [.image], delegate: CardDrop(card: $card))
                .modifier(CardToolBar(currentModal: $currentModal))
                .cardModals(card: $card, currentModal: $currentModal)
                .frame(
                    width: calculateSize(proxy.size).width,
                    height: calculateSize(proxy.size).height
                )
                .clipped()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .onChange(of: scenePhase, { _, newValue in
                    if newValue == .inactive {
                        card.save()
                    }
                })
                .onDisappear {
                    card.save()
                }
        }
    }
    
    func content(size: CGSize) -> some View {
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
                .resizableView(
                    transform: bindingTransform(for: element),
                    viewScale: calculateScale(size)
                )
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
    
    func calculateSize(_ size: CGSize) -> CGSize {
        var newSize = size
        let ratio = Settings.cardSize.width / Settings.cardSize.height
        
        if size.width < size.height {
            newSize.height = min(size.height, newSize.width / ratio)
            newSize.width = min(size.width, newSize.height * ratio)
        } else {
            newSize.width = min(size.width, newSize.height * ratio)
            newSize.height = min(size.height, newSize.width / ratio)
        }
        return newSize
    }
    
    func calculateScale(_ size: CGSize) -> CGFloat {
        let newSize = calculateSize(size)
        return newSize.width / Settings.cardSize.width
    }
}

#Preview {
    @State var card = initialCards[0]
    
    return CardDetailView(card: $card)
        .environmentObject(ViewState(card: card))
}
