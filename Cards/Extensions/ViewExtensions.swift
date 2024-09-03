//
//  ViewExtensions.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

extension View {
    func resizableView(
        transform: Binding<Transform>,
        viewScale: CGFloat = 1
    ) -> some View {
        modifier(
            ResizableView(
                transform: transform,
                viewScale: viewScale
            )
        )
    }
}
