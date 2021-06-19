//
//  RestaurantDetailInfoView.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import SwiftUI



struct RestaurantDetailInfoView: View {
    
    let detail: RestaurantDetail?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack { Spacer() }
            
            Text("Location & Description")
                .font(.title3.bold())
            Text("\(detail?.city ?? ""), \(detail?.country ?? "")")
            
            HStack {
                ForEach(0..<5, id: \.self) { num in
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.orange)
                }
            }
        }
        .padding(.top)
        .padding(.horizontal)
        
        Text(detail?.description ?? "")
            .font(.caption)
            .padding()
    }
}

struct RestaurantDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView()
    }
}
