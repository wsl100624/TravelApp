//
//  RestaurantDetailReviewListView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailReviewListView: View {
    
    let reviews: [Review]
    
    var body: some View {
        
        HStack {
            Text("Customer Reviews")
                .font(.title3.bold())
            Spacer()
        }
        .padding(.top)
        .padding(.horizontal)
        
        ForEach(reviews, id: \.self) { review in
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    KFImage(URL(string: review.user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(review.user.firstName)
                            .font(.caption.bold())
                        HStack {
                            ForEach(0..<review.rating, id: \.self) { num in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                            }
                            
                            ForEach(0..<(5-review.rating), id: \.self) { num in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.secondary)
                            }
                        }.font(.caption2)
                    }
                    Spacer()
                    Text("Dec 2020")
                        .foregroundColor(.secondary)
                        .font(.caption.bold())
                }
                
                Text(review.text)
                    .font(.caption)
            }
            .padding(.horizontal)
       }
    }
}

struct RestaurantDetailReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView()
    }
}
