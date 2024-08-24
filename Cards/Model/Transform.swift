//
//  Transform.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct Transform {
    var size = CGSize(
        width: Settings.defaultElementSize.width,
        height: Settings.defaultElementSize.height
    )
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}
