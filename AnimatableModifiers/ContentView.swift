//
//  ContentView.swift
//  AnimatableModifiers
//
//  Created by Milko Škofič on 30/05/21.
//

import SwiftUI

// A modifier that animates a font through various sizes.
struct AnimatableCustomFontModifier: AnimatableModifier {
    var name: String
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

// For system fonts
struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

// To make that easier to use, I recommend wrapping
// it in a `View` extension, like this:
extension View {
    func animatableFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }

    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

// An example View trying it out
struct ContentView: View {
    @State private var customFontSize: CGFloat = 32
    @State private var systemFontSize: CGFloat = 32

    var body: some View {
        VStack {
            Text("Hello!")
                .animatableFont(name: "Optima", size: customFontSize)
                .onTapGesture {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatCount(4)) {
                        if customFontSize == 32 {
                            customFontSize = 72
                        } else {
                            customFontSize = 32
                        }
                    }
                }
                .padding(.vertical)

            Text("Hello!")
                .animatableSystemFont(size: systemFontSize)
                .onTapGesture {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        if systemFontSize == 32 {
                            systemFontSize = 72
                        } else {
                            systemFontSize = 32
                        }
                    }
                }
                .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
