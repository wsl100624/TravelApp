//
//  RestaurantDetailView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            RestaurantDetailTopView(restaurant: restaurant)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Location & Description")
                    .font(.title3.bold())
                Text("Tokyo, Japan")
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                    }
                }
                
                Text("Usually when you want to write a very long description, you want tot make sure that it spans at least a few lines, When I'm testing I like to see at least 5 lines of text so that things are auto sized correctly. One more line of text just to be safe.")
                    .padding(.top, 8)
                    .font(.callout)
            }.padding()
            
            HStack {
                Text("Popular Dishes")
                    .font(.title3.bold())
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { num in
                        VStack(alignment: .leading) {
                            Image("image8")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .cornerRadius(5)
                                .shadow(radius: 3)
                                .padding(.vertical, 5)
                            Text("Japanese Tapas")
                                .font(.callout.bold())
                            Text("9 Photos")
                                .foregroundColor(.secondary)
                                .font(.caption.bold())
                        }
                    }
                }.padding(.horizontal)
            }
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailView(restaurant: popularRestaurant.last!)
        }
        
    }
}
