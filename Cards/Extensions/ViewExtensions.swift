//
//  ViewExtensions.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

extension View {
    func resizableView() -> some View {
        return modifier(ResizableView())
    }
}
