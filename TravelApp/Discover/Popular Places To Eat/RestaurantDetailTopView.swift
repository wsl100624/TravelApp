//
//  RestaurantDetailTopView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailTopView: View {
    
    let detail: RestaurantDetail?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            KFImage(URL(string: detail?.thumbnail ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 1, height: 350)
            
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text(detail?.name ?? "")
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
                
                Button(action: {}, label: {
                    NavigationLink(
                        destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                        label: {
                            Text("See more photos")
                                .multilineTextAlignment(.trailing)
                        })
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
        NavigationView {
            RestaurantDetailView()
        }
        
    }
}
