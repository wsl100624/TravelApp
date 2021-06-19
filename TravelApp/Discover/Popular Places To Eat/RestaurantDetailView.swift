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
            
            if let reviews = vm.details?.reviews {
                RestaurantDetailReviewListView(reviews: reviews)
            }
            
        }
        .navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}



struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailView()
        }
        
    }
}
