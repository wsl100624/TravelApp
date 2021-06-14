//
//  TrendingCreatorsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    var items = [
        Creator(name: "Amy Tang", imageName: creatorImages.randomElement()!),
        Creator(name: "Harvey Buddy", imageName: creatorImages.randomElement()!),
        Creator(name: "Hilde Wade", imageName: creatorImages.randomElement()!),
        Creator(name: "Mark Russell", imageName: creatorImages.randomElement()!),
        Creator(name: "Will Wang", imageName: creatorImages.randomElement()!),
        Creator(name: "Jason C", imageName: creatorImages.randomElement()!),
        Creator(name: "Milky Williams", imageName: creatorImages.randomElement()!),
        Creator(name: "Tom Witten", imageName: creatorImages.randomElement()!),
        Creator(name: "Rob Bentley", imageName: creatorImages.randomElement()!)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                    .font(.title2).bold()
                Spacer()
                Text("See all")
                    .font(.callout)
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(items, id: \.self) { item in
                        VStack {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .cornerRadius(40)
                                .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 3)
                            
                            Text(item.name)
                                .font(.system(.caption))
                        }
                        .frame(width: 80)
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
