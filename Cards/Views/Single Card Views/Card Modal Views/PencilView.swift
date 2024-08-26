//
//  PencilView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 26.08.24.
//

import SwiftUI
import PencilKit

struct PencilView: View {
    @State private var canvas = PKCanvasView()
    
    var body: some View {
        PencilViewRepresentable(canvas: $canvas)
    }
}

#Preview {
    PencilView()
}

struct PencilViewRepresentable: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    
    func makeUIView(context: Context) -> some UIView {
        canvas.drawingPolicy = .anyInput
        return canvas
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
