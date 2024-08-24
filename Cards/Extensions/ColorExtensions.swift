//
//  ColorExtensions.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

extension Color {
    static let colors: [Color] = [.green, .red, .blue, .yellow, .pink, .orange, .purple]
    
    static func random() -> Color {
        colors.randomElement() ?? .blue
    }
}
