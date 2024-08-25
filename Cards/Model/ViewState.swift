//
//  ViewState.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedCard = nil
            }
        }
    }
    
    var selectedCard: Card?
    
    convenience init(card: Card) {
        self.init()
        showAllCards = false
        selectedCard = card
    }
}
