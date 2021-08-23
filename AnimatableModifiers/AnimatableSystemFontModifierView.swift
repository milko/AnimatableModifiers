//
//  AnimatableSystemFontModifierView.swift
//  AnimatableModifiers
//
//  Created by Milko Škofič on 30/05/21.
//

import SwiftUI

/// A modifier that animates a font through various sizes.
/// This is the version for system fonts.
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

// Make the modifier a View extension.
extension View {
    
    /// Animate custom font size without losing resolution.
    /// - Parameters:
    ///   - size: Initial font size
    ///   - weight: Font weight
    ///   - design: Font class - e.g. monospaced, serif
    /// - Returns: The view with the applied modifier
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}


struct AnimatableSystemFontModifierView: View {
    @State private var fontSize: CGFloat = 32

    var body: some View {

        VStack {
            Text("animatableSystemont()")
                .font(.title3)
            Spacer()
            Text("Hello!")
                .animatableSystemFont(size: fontSize)
                .onTapGesture {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        if fontSize == 32 {
                            fontSize = 96
                        } else {
                            fontSize = 32
                        }
                    }
            }
            Spacer()

            HStack {
                Text("Tap on \"Hello\"")
                Image(systemName: "arrow.up")
            }
        }
    
    }
}

struct AnimatableSystemFontModifierView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableSystemFontModifierView()
    }
}
