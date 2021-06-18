//
//  PopularDestinationsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    var items = popularDestinations
    
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
                            destination:
                                NavigationLazyView(
                                    PopularDestinationDetailView(name: item.name)
                                ),
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
