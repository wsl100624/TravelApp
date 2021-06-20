//
//  View+Extension.swift
//  TravelApp
//
//  Created by Will Wang on 6/14/21.
//

import SwiftUI

extension View {
    
    func asTile() -> some View {
        modifier(TileModifer())
    }
    
    func niceShadow() -> some View {
        modifier(ShadowModifer())
    }
}


struct TileModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 2)
    }
}


struct ShadowModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 3)
    }
}
