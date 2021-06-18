//
//  PopularDestinationTile.swift
//  TravelApp
//
//  Created by Will Wang on 6/15/21.
//

import SwiftUI

struct PopularDestinationTile: View {
    
    var item: Destination
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(item.imageNames.first!)
                .resizable().scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(5)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            
            Text(item.name)
                .font(.callout).bold()
                .foregroundColor(Color(.label))
                .padding(.horizontal, 12)
            
            Text(item.country)
                .font(.callout)
                .foregroundColor(.secondary)
                .padding(.horizontal, 12)
                .padding(.bottom)
        }
        .asTile()
    }
}

struct PopularDestinationTile_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationTile(item: .init(name: "Name", country: "Country", imageNames: ["image0", "creator1"], latitude: 48.864716, longitude: 2.349014))
    }
}
