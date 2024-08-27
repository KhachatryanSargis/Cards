//
//  CardElementView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 25.08.24.
//

import SwiftUI

struct CardElementView: View {
    let element: CardElement
    let selected: Bool
    
    var body: some View {
        if let element = element as? ImageElement {
            ImageElementView(element: element)
                .border(
                    Settings.borderColor,
                    width: selected ? Settings.borderWidth : 0
                )
        }
        if let element = element as? TextElement {
            TextElementView(element: element)
                .border(
                    Settings.borderColor,
                    width: selected ? Settings.borderWidth : 0
                )
        }
    }
}

struct ImageElementView: View {
    let element: ImageElement
    
    var body: some View {
        if let frame = element.frame {
            bodyMain
                .clipShape(frame)
        } else {
            bodyMain
        }
    }
    
    var bodyMain: some View {
        element.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct TextElementView: View {
    let element: TextElement
    
    var body: some View {
        if !element.text.isEmpty {
            Text(element.text)
                .font(.custom(element.textFont, size: 200))
                .foregroundStyle(element.textColor)
                .scalableText()
        }
    }
}

#Preview {
    CardElementView(element: initialElements[0], selected: true)
}
