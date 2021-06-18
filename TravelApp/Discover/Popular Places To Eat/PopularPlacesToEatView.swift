//
//  PopularPlacesToEatView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct PopularPlacesToEatView: View {
    
    var items = popularRestaurant
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.title2).bold()
                Spacer()
                Text("See all")
                    .font(.callout)
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(items, id: \.self) { item in
                        NavigationLink(
                            destination:
                            
                                RestaurantDetailView(restaurant: item),
                            label: {
                                RestaurantTile(item: item)
                                    .foregroundColor(Color(.label))
                            })
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
//        PopularPlacesToEatView()
    }
}
