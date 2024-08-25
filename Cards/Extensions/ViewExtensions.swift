//
//  ViewExtensions.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

extension View {
    func resizableView(transform: Binding<Transform>) -> some View {
        return modifier(ResizableView(transform: transform))
    }
}
