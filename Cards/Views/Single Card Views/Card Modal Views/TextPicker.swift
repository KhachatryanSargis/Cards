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
        TextField(
            "Enter Text",
            text: $textElement.text,
            onCommit: onCommit
        )
        
    }
}

#Preview {
    @State var textElement = TextElement()
    return TextPicker(textElement: $textElement)
}
