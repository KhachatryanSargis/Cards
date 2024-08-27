//
//  AnyShape.swift
//  Cards
//
//  Created by Sargis Khachatryan on 26.08.24.
//

import SwiftUI

struct AnyShape: Shape {
    private let path: (CGRect) -> Path
    
    func path(in rect: CGRect) -> Path {
        path(rect)
    }
    
    init<CustomShape: Shape>(_ shape: CustomShape) {
        self.path = { rect in
            shape.path(in: rect)
        }
    }
}
