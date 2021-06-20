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
            .background(Color(.systemBackground))
            .cornerRadius(5)
            .niceShadow()
    }
}


struct ShadowModifer: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .init(.sRGB, white: 0.8, opacity: colorScheme == .light ? 1 : 0), radius: 5, x: 0.0, y: 2)
    }
}
