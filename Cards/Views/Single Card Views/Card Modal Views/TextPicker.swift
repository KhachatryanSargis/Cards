//
//  TextPicker.swift
//  Cards
//
//  Created by Sargis Khachatryan on 02.09.24.
//

import SwiftUI

struct TextPicker: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var textElement: TextElement
    
    var body: some View {
        let onCommit = {
            dismiss()
        }
        VStack {
            TextField(
                "Enter text",
                text: $textElement.text,
                onCommit: onCommit
            )
            .font(.custom(textElement.textFont, size: 30))
            .foregroundColor(textElement.textColor)
            TextView(
                font: $textElement.textFont,
                color: $textElement.textColor
            )
        }
    }
}

#Preview {
    @State var textElement = TextElement()
    return TextPicker(textElement: $textElement)
}
