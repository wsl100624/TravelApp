//
//  DishView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI
import Kingfisher

struct DishView: View {
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(5)
                    .padding(.vertical, 5)
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                Text(dish.price)
                    .foregroundColor(.white)
                    .font(.callout.bold())
                    .padding(.horizontal, 6)
                    .padding(.bottom, 6)
            }
            .frame(height: 120)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.7, opacity: 1), radius: 5, x: 0.0, y: 2)
            .padding(.top, 2)
            
            Text(dish.name)
                .font(.caption.bold())
            Text("\(dish.numPhotos) Photos")
                .foregroundColor(.secondary)
                .font(.caption.bold())
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(dish: .init(name: "Dish", price: "12.99", photo: "", numPhotos: 5))
    }
}
