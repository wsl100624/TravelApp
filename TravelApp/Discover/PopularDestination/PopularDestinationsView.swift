//
//  PopularDestinationsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    var items = [
        Destination(name: "Paris", country: "France", imageName: "image0", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Circle Pines", country: "USA", imageName: "image2", latitude: 45.141927012290104, longitude: -93.16137679266993),
        Destination(name: "Minnesota", country: "USA", imageName: "image2", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Beijing", country: "China", imageName: "image3", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Circle Pines", country: "USA", imageName: "image4", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Minneapolis", country: "USA", imageName: "image5", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Shore View", country: "USA", imageName: "image6", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Beijing", country: "China", imageName: "image7", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Beijing", country: "China", imageName: "image8", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Beijing", country: "China", imageName: "image9", latitude: 48.864716, longitude: 2.349014),
    ]
    
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.title2).bold()
                Spacer()
                Text("See all")
                    .font(.callout)
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items, id: \.self) { item in
                        NavigationLink(
                            destination: PopularDestinationDetailView(item: item),
                            label: {
                                PopularDestinationTile(item: item)
                                    .padding(.bottom)
                            })
                    }
                }.padding(.horizontal)
            }
        }
    }
}





struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        
//        PopularDestinationDetailView(item: .init(name: "Paris", country: "France", imageName: "image0", latitude: 48.864716, longitude: 2.349014))
        DiscoverView()
//        PopularDestinationsView()
    }
}
