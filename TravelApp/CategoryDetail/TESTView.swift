//
//  TESTView.swift
//  TravelApp
//
//  Created by Will Wang on 6/15/21.
//

import SwiftUI

struct TESTView: View {
    var columns: [GridItem] =
        Array(repeating: .init(.fixed(200), spacing: 0, alignment: .leading), count: 3)
    
    var body: some View {
        
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: Array(repeating: .init(.fixed(200), spacing: 0, alignment: .leading), count: 3), alignment: .top) {
                    ForEach((0...79), id: \.self) {
                        let codepoint = $0 + 0x1f600
                        let codepointString = String(format: "%02X", codepoint)
                        
                        Image("image8")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        Image("image3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(Color.yellow)
                        
                        Image("image5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .background(Color.yellow)
                    }
                }.font(.largeTitle)
            }.background(Color.blue)
        }
        
    }
}

struct TESTView_Previews: PreviewProvider {
    static var previews: some View {
        TESTView()
    }
}
