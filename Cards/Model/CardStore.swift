//
//  CardStore.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

class CardStore: ObservableObject {
    @Published var cards: [Card] = []
    
    init(defaultData: Bool = false) {
        cards = defaultData ? initialCards : load()
    }
    
    func addCard() -> Card {
        let card = Card(backgroundColor: Color.random())
        cards.append(card)
        card.save()
        return card
    }
    
    func index(for card: Card) -> Int? {
        cards.firstIndex { $0.id == card.id }
    }
    
    func remove(_ card: Card) {
        if let index = index(for: card) {
            for element in cards[index].elements {
                cards[index].remove(element)
            }
            UIImage.remove(name: card.id.uuidString)
            if let filepath = FileManager.documentURL?
                .absoluteURL.appendingPathComponent("\(card.id.uuidString).rwcard") {
                try? FileManager.default.removeItem(at: filepath)
            }
            cards.remove(at: index)
        }
    }
}

extension CardStore {
    func load() -> [Card] {
        var cards: [Card] = []
        
        guard let path = FileManager.documentURL?.path(),
              let enumarator = FileManager.default.enumerator(atPath: path),
              let files = enumarator.allObjects as? [String]
        else { return cards }
        
        let cardFiles = files.filter { $0.contains(".rwcard") }
        for cardFile in cardFiles {
            do {
                let path = path + "/" + cardFile
                let data = try Data(contentsOf: URL(filePath: path))
                let decoder = JSONDecoder()
                let card = try decoder.decode(Card.self, from: data)
                cards.append(card)
            } catch {
                print("Error: ", error.localizedDescription)
            }
        }
        
        return cards
    }
}
