//
//  DiscoverCategoriesView.swift
//  TravelApp
//
//  Created by Will Wang on 6/13/21.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    var items = [
        Place(name: "Art", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Sports", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Food", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Hello", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Live Events", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Live Events", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Live Events", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Live Events", thumbnail: discoverIcons.randomElement()!),
        Place(name: "Library", thumbnail: discoverIcons.randomElement()!)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    
                    NavigationLink(
                        destination:
                            NavigationLazyView(CategoryDetailsView(name: item.name)),
                        label: {
                            VStack(spacing: 4) {
                                Image(systemName: item.thumbnail)
                                    .font(.title)
                                    .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                                    .frame(width: 80, height: 80)
                                    .background(Color.defaultBackground)
                                    .cornerRadius(40)
                                Text(item.name)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                            }.frame(width: 80)
                        })
                }
            }
            .padding(.horizontal)
        }
    }
}



struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        DiscoverCategoriesView()
        
        DiscoverView()
    }
}
