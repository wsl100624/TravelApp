//
//  CreatorView.swift
//  TravelApp
//
//  Created by Will Wang on 6/19/21.
//

import SwiftUI

struct CreatorView: View {
    
    var item: Creator
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(40)
                .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 3)
            
            Text(item.name)
                .font(.caption.bold())
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .frame(width: 80)
    }
}

struct CreatorView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
