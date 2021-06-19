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

struct RestaurantDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
        }
    }
}
