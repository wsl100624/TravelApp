//
//  RestaurantTile.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI

struct RestaurantTile: View {
    var item: Restaurant
    
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .background(Color.gray)
                .cornerRadius(5)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            VStack(alignment: .leading, spacing: 6) {
                HStack() {
                    Text(item.name)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    })
                }
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.7 • Sushi • $$")
                }
                Text("Tokyo, Japan")
            }.font(.system(.callout).bold())
            
            Spacer()
        }
        .frame(width: 300)
        .asTile()
        .padding(.bottom)
    }
}

struct RestaurantTile_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantTile(item: popularRestaurant.first!)
    }
}
