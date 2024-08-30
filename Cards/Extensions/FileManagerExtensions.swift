//
//  FileManagerExtensions.swift
//  Cards
//
//  Created by Sargis Khachatryan on 30.08.24.
//

import Foundation

extension FileManager {
    static var documentURL: URL? {
        return Self.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first
    }
}
