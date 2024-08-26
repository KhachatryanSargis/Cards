//
//  StickerPicker.swift
//  Cards
//
//  Created by Sargis Khachatryan on 25.08.24.
//

import SwiftUI

struct StickerPicker: View {
    @Environment(\.dismiss) var dismiss
    @State private var stickerNames: [String] = []
    @Binding var stickerImage: UIImage?
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(stickerNames, id: \.self) { sticker in
                    Image(uiImage: image(from: sticker))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            stickerImage = image(from: sticker)
                            dismiss()
                        }
                }
            }
        }
        .onAppear {
            stickerNames = loadStickers()
        }
    }
    
    func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickerNames: [String] = []
        
        let fileManager = FileManager.default
        if let resourcePath = Bundle.main.resourcePath,
           let enumerator = fileManager.enumerator(
            at: URL(fileURLWithPath: resourcePath + "/Stickers"),
            includingPropertiesForKeys: nil,
            options: [
                .skipsSubdirectoryDescendants,
                .skipsHiddenFiles
            ]) {
            for case let url as URL in enumerator where url.hasDirectoryPath {
                themes.append(url)
            }
        }
        
        for theme in themes {
            if let files = try? fileManager.contentsOfDirectory(atPath: theme.path()) {
                for file in files {
                    stickerNames.append(theme.path() + "/" + file)
                }
            }
        }
        
        return stickerNames
    }
    
    func image(from path: String) -> UIImage {
        print("loading", path)
        return UIImage(named: path) ?? UIImage(named: "error-image") ?? UIImage()
    }
}

// The Preview is not working, research later!
//#Preview {
//    StickerPicker(stickerImage: .constant(UIImage()))
//}
