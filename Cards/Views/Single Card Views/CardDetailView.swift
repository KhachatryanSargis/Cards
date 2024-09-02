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
        content
            .onDrop(of: [.image], delegate: CardDrop(card: $card))
            .modifier(CardToolBar(currentModal: $currentModal))
            .cardModals(card: $card, currentModal: $currentModal)
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
