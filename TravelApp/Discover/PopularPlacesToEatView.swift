//
//  PopularPlacesToEatView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct PopularPlacesToEatView: View {
    
    var items = [
        Destination(name: "Minnesota", country: "USA", imageName: "image0", latitude: 48.864716, longitude: 2.349014),
        Destination(name: "Beijing", country: "China", imageName: "image2", latitude: 48.864716, longitude: 2.349014),
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
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 80)
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
                                Text(item.country)
                            }.font(.system(.callout).bold())
                            
                            Spacer()
                        }
                        .frame(width: 300)
                        .asTile()
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlacesToEatView()
    }
}
