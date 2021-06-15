//
//  PopularDestinationDetailView.swift
//  TravelApp
//
//  Created by Will Wang on 6/15/21.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailView: View {
    
    var item: Destination
    
    @State var region: MKCoordinateRegion
    
    init(item: Destination) {
        self.item = item
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: item.latitude, longitude: item.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    var body: some View {
        ScrollView {
            
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
            
            VStack(alignment: .leading, spacing: 12) {
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(item.name)
                        .font(.largeTitle.bold())
                    Text(item.country)
                        .foregroundColor(.secondary)
                        .font(.caption.bold())
                }
                
                HStack(alignment: .top, spacing: 8, content: {
                    ForEach(0 ..< 5) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                })
                
                Text("Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.Unable to present. Please file a bug.")
//                                    .lineLimit(7)
            }.padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.title2.bold())
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
            
            Map(coordinateRegion: $region)
                .frame(height: 200)
                .padding(.bottom, 40)
            
        }.ignoresSafeArea()
    }
}

struct PopularDestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationDetailView(item: .init(name: "Paris", country: "France", imageName: "image0", latitude: 48.864716, longitude: 2.349014))
//        DiscoverView()
//        PopularDestinationsView()
    }
}
