//
//  SplashScreen.swift
//  Cards
//
//  Created by Sargis Khachatryan on 03.09.24.
//

import SwiftUI

struct SplashScreen: View {
    private struct SplashAnimation: ViewModifier {
        @State private var animating = true
        
        let finalYPosition: CGFloat
        let delay: Double
        
        func body(content: Content) -> some View {
            content
                .offset(y: animating ? -700 : finalYPosition)
                .rotationEffect(
                    animating ? .zero : Angle(degrees: .random(in: -10...10))
                )
                .animation(
                    .interpolatingSpring(
                        mass: 0.2,
                        stiffness: 80,
                        damping: 5,
                        initialVelocity: 0.8
                    ).delay(delay),
                    value: animating
                )
                .onAppear {
                    animating = false
                }
        }
    }
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            card(letter: "S", color: "appColor1")
                .modifier(SplashAnimation(finalYPosition: 240, delay: 0))
            card(letter: "D", color: "appColor2")
                .modifier(SplashAnimation(finalYPosition: 120, delay: 0.2))
            card(letter: "R", color: "appColor3")
                .modifier(SplashAnimation(finalYPosition: 0, delay: 0.4))
            card(letter: "A", color: "appColor6")
                .modifier(SplashAnimation(finalYPosition: -120, delay: 0.6))
            card(letter: "C", color: "appColor7")
                .modifier(SplashAnimation(finalYPosition: -240, delay: 0.8))
        }
    }
    
    func card(letter: String, color: String) -> some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                .shadow(radius: 3)
                .frame(width: 120, height: 160)
                .foregroundStyle(.white)
            Text(letter)
                .fontWeight(.bold)
                .scalableText()
                .foregroundStyle(Color(color))
                .frame(width: 80)
        }
    }
}

#Preview {
    SplashScreen()
}
