//
//  RestaurantDetailTopView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI

struct RestaurantDetailTopView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .foregroundColor(.white)
                        .font(.title2.bold())
                    HStack {
                        ForEach(0 ..< 5) { item in
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                        }
                    }
                }
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See more photos")
                        .multilineTextAlignment(.trailing)
                })
                .foregroundColor(.white)
                .font(.body)
                .frame(width: 80)
            }.padding()
            
        }
    }
}

struct RestaurantDetailTopView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailTopView(restaurant: popularRestaurant.first!)
    }
}
