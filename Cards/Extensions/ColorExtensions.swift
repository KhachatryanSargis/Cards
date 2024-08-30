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

extension Color {
    func colorComponents() -> [CGFloat] {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha)
        return [red, green, blue, alpha]
    }
    
    static func color(components color: [CGFloat]) -> Color {
        let uiColor = UIColor(
            red: color[0],
            green: color[1],
            blue: color[2],
            alpha: color[3])
        return Color(uiColor)
    }
}
