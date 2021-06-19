//
//  RestaurantDetailView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailView: View {
    
    @ObservedObject var vm = RestaurantDetailViewModel()
    
    var body: some View {
        
        ScrollView {
            
            RestaurantDetailTopView(detail: vm.details)
            RestaurantDetailInfoView(detail: vm.details)
            
            HStack {
                Text("Popular Dishes")
                    .font(.title3.bold())
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(vm.details?.popularDishes ?? [], id: \.self) { dish in
                        DishView(dish: dish)
                    }
                }.padding(.horizontal)
            }
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

struct RestaurantDetailInfoView: View {
    
    let detail: RestaurantDetail?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Location & Description")
                .font(.title3.bold())
            Text("\(detail?.city ?? ""), \(detail?.country ?? "")")
            
            HStack {
                ForEach(0..<5, id: \.self) { num in
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.orange)
                }
            }
            
            Text(detail?.description ?? "")
                .padding(.top, 8)
                .font(.callout)
        }.padding()
    }
}



struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            RestaurantDetailView(restaurant: popularRestaurant.last!)
        }
        
    }
}
