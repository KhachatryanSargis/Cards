//
//  ContentView.swift
//  Cards
//
//  Created by Sargis Khachatryan on 23.08.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Text("Hello, World!")
                    .background(.red)
                Text("Hello, World!")
                    .padding()
                    .background(.red)
            }
            .frame(width: proxy.size.width * 0.8)
            .background(.gray)
            .padding(.leading, (proxy.size.width - proxy.size.width * 0.8) / 2)
        }
        .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 500, height: 300))
    }
}
