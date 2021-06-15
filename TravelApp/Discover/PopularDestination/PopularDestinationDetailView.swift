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
    var attractions: [Attraction] = [
        .init(name: "Eiffel Tower", lat: 48.859565, long: 2.2946),
        .init(name: "Champs-Elysees", lat: 48.859565, long: 2.311780),
        .init(name: "Louvre Museum", lat: 48.859565, long: 2.337789)
    ]
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = false
    
    init(item: Destination) {
        self.item = item
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: item.latitude, longitude: item.longitude), span: .init(latitudeDelta: 0.07, longitudeDelta: 0.07)))
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
                                    .lineLimit(3)
            }.padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.title2.bold())
                Spacer()
                
                Button(action: {
                    isShowingAttractions.toggle()
                }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .foregroundColor(.secondary)
                        .font(.callout.bold())
                })
                
                Toggle("TITLEToggle", isOn: $isShowingAttractions).labelsHidden()
            }
            .padding(.top)
            .padding(.horizontal)
//
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
                MapMarker(coordinate: .init(latitude: attraction.lat, longitude: attraction.long), tint: Color(UIColor.systemBlue))
            }
            .frame(height: 300)
            
        }.ignoresSafeArea()
    }
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name: String
    let lat, long: Double
}


struct PopularDestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationDetailView(item: .init(name: "Paris", country: "France", imageName: "image0", latitude: 48.864716, longitude: 2.349014))
//        DiscoverView()
//        PopularDestinationsView()
    }
}
