//
//  PreviewData.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

let initialCards: [Card] = [
    Card(backgroundColor: Color("random1"), elements: initialElements),
    Card(backgroundColor: Color("random2")),
    Card(backgroundColor: Color("random3")),
    Card(backgroundColor: Color("random4")),
    Card(backgroundColor: Color("random8"))
]

let initialElements: [CardElement] = [
    ImageElement(
        transform: Transform(
            size: CGSize(width: 370, height: 266),
            rotation: .init(degrees: -6),
            offset: CGSize(width: 4, height: -137)
        ),
        image: Image("giraffe")
    ),
    TextElement(
        transform: Transform(
            size: CGSize(width: 300, height: 100),
            offset: CGSize(width: 12, height: 81)),
        text: "Snack time!",
        textColor: .blue)
]
