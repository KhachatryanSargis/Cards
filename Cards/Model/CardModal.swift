//
//  CardModal.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import Foundation

enum CardModal: Identifiable {
    var id: Int { hashValue }
    
    case photoPicker
    case framePicker
    case stickerPicker
    case textPicker
    case shareSheet
}
