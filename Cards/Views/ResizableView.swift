//
//  ResizableView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct ResizableView: ViewModifier {
    @Binding var transform: Transform
    @State private var previousOffset: CGSize = .zero
    @State private var previousRotation: Angle = .zero
    @State private var scale: CGFloat = 1
    
    func body(content: Content) -> some View {
        let scaleGesture = MagnifyGesture()
            .onChanged { value in
                scale = value.magnification
            }
            .onEnded { value in
                transform.size.width *= scale
                transform.size.height *= scale
                scale = 1
            }
        let rotationGesture = RotateGesture()
            .onChanged { value in
                transform.rotation += value.rotation - previousRotation
                previousRotation = value.rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
        content
            .frame(
                width: transform.size.width,
                height: transform.size.height
            )
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
            .onAppear {
                previousOffset = transform.offset
            }
    }
}

#Preview {
    RoundedRectangle(cornerRadius: 30)
        .foregroundStyle(Color.red)
        .resizableView(transform: .constant(Transform()))
}
