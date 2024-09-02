//
//  Card.swift
//  Cards
//
//  Created by Sargis Khachatryan on 24.08.24.
//

import SwiftUI

struct Card: Identifiable {
    private(set) var id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    mutating func remove(_ element: CardElement) {
        if let element = element as? ImageElement {
            UIImage.remove(name: element.imageFilename)
        }
        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
        save()
    }
    
    mutating func addElement(uiImage: UIImage) {
        let imageFilename = uiImage.save()
        let image = Image(uiImage: uiImage)
        let element = ImageElement(
            image: image,
            imageFilename: imageFilename
        )
        elements.append(element)
        save()
    }
    
    mutating func addElement(_ textElement: TextElement) {
        elements.append(textElement)
        save()
    }
    
    mutating func update(_ element: CardElement?, frame: AnyShape) {
        if let element = element as? ImageElement,
           let index = element.index(in: elements) {
            var newElement = element
            newElement.frame = frame
            elements[index] = newElement
        }
        save()
    }
    
    func save() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(self)
            let filename = "\(id).rwcard"
            if let url = FileManager.documentURL?.appendingPathComponent(filename) {
                try data.write(to: url)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension Card: Codable {
    enum CodingKeys: CodingKey {
        case id
        case backgroundColor
        case imageElements
        case textElements
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: id) ?? UUID()
        elements += try container.decode([ImageElement].self, forKey: .imageElements)
        elements += try container.decode([TextElement].self, forKey: .textElements)
        let components = try container.decode([CGFloat].self, forKey: .backgroundColor)
        self.backgroundColor = Color.color(components: components)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id.uuidString, forKey: .id)
        let imageElements: [ImageElement] = elements.compactMap { $0 as? ImageElement }
        try container.encode(imageElements, forKey: .imageElements)
        let textElements: [TextElement] = elements.compactMap { $0 as? TextElement }
        try container.encode(textElements, forKey: .textElements)
        let components = backgroundColor.colorComponents()
        try container.encode(components, forKey: .backgroundColor)
    }
}
