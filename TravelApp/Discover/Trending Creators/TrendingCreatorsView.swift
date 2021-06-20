//
//  TrendingCreatorsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    var items = [
        Creator(name: "Amy Tang", imageName: creatorImages.randomElement()!, id: 0),
        Creator(name: "Harvey Buddy", imageName: creatorImages.randomElement()!, id: 1),
        Creator(name: "Hilde Wade", imageName: creatorImages.randomElement()!, id: 2),
        Creator(name: "Mark Russell", imageName: creatorImages.randomElement()!, id: 3),
        Creator(name: "Will Wang", imageName: creatorImages.randomElement()!, id: 4),
        Creator(name: "Jason C", imageName: creatorImages.randomElement()!, id: 5),
        Creator(name: "Milky Williams", imageName: creatorImages.randomElement()!, id: 6),
        Creator(name: "Tom Witten", imageName: creatorImages.randomElement()!, id: 7),
        Creator(name: "Rob Bentley", imageName: creatorImages.randomElement()!, id: 8)
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
                    ForEach(items, id: \.self) { creator in
                        NavigationLink(
                            destination: NavigationLazyView(
                                CreatorDetailView(creator: creator)
                            ),
                            label: {
                                CreatorView(item: creator)
                            })
                    }
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
        }
    }
}


struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrendingCreatorsView()
        }
        
    }
}
