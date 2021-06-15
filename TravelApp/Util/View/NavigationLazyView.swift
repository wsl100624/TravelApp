//
//  NavigationLazyView.swift
//  TravelApp
//
//  Created by Will Wang on 6/15/21.
//

import SwiftUI


struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
