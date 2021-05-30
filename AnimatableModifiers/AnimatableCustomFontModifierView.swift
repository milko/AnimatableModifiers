//
//  AnimatableCustomFontModifierView.swift
//  AnimatableModifiers
//
//  Created by Milko Škofič on 30/05/21.
//

import SwiftUI

/// A modifier that animates a font through various sizes.
/// This is the version for custom fonts.
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

// Make the modifier a View extension.
extension View {
    
    /// Animate custom font size without losing resolution.
    /// - Parameters:
    ///   - name: Font name
    ///   - size: Initial font size
    /// - Returns: The view with the applied modifier
    func animatableCustomFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}


struct AnimatableCustomFontModifierView: View {
    @State private var fontSize: CGFloat = 32

    var body: some View {

        VStack {
            Text("animatableCustomFont()")
                .font(.title3)
            Spacer()
            Text("Hello!")
                .animatableCustomFont(name: "Noteworthy", size: fontSize)
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

struct AnimatableCustomFontModifierView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableCustomFontModifierView()
    }
}
