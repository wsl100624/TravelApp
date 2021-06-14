//
//  LoadingView.swift
//  TravelApp
//
//  Created by Will Wang on 6/14/21.
//

import UIKit
import SwiftUI

struct LoadingView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let loadingView = UIActivityIndicatorView(style: .large)
        loadingView.startAnimating()
        loadingView.color = .white
        return loadingView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    
    typealias UIViewType = UIActivityIndicatorView
}
