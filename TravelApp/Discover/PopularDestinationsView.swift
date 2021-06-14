//
//  PopularDestinationsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    var items = [
        Destinations(name: "Minnesota", country: "USA", imageName: "image0"),
        Destinations(name: "Beijing", country: "China", imageName: "image2"),
        Destinations(name: "Minnesota", country: "USA", imageName: "image2"),
        Destinations(name: "Beijing", country: "China", imageName: "image3"),
        Destinations(name: "Circle Pines", country: "USA", imageName: "image4"),
        Destinations(name: "Minneapolis", country: "USA", imageName: "image5"),
        Destinations(name: "Shore View", country: "USA", imageName: "image6"),
        Destinations(name: "Beijing", country: "China", imageName: "image7"),
        Destinations(name: "Beijing", country: "China", imageName: "image8"),
        Destinations(name: "Beijing", country: "China", imageName: "image9"),
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
                        VStack(alignment: .leading) {
                            
                            Image(item.imageName)
                                .resizable().scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(5)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 8)
                            
                            Text(item.name)
                                .font(.callout).bold()
                                .padding(.horizontal, 12)
                            
                            Text(item.country)
                                .font(.callout)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 12)
                                .padding(.bottom)
                        }
                        .asTile()
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        PopularDestinationsView()
    }
}
