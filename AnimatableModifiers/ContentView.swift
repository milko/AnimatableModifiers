//
//  ContentView.swift
//  AnimatableModifiers
//
//  Created by Milko Škofič on 30/05/21.
//

import SwiftUI

// An example View trying it out
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: AnimatableCustomFontModifierView(),
                    label: {
                        VStack(alignment: .leading, spacing: 2, content: {
                            Text(".animatableCustomFont()")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("An animation modifier for custom fonts, it animates size without losing font resolution.")
                                .font(.caption)
                        })
                    })
                
                NavigationLink(
                    destination: AnimatableSystemFontModifierView(),
                    label: {
                        VStack(alignment: .leading, spacing: 2, content: {
                            Text(".animatableSystemFont()")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("An animation modifier for system fonts, it animates size without losing font resolution.")
                                .font(.caption)
                        })
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
