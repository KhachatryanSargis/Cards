//
//  AngleExtensions.swift
//  Cards
//
//  Created by Sargis Khachatryan on 30.08.24.
//

import SwiftUI

extension Angle: Codable {
    enum CodingKeys: CodingKey {
        case degrees
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let degrees = try container.decode(Double.self, forKey: .degrees)
        self.init(degrees: degrees)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(degrees, forKey: .degrees)
    }
}
