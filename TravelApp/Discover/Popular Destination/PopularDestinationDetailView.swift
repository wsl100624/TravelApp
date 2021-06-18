//
//  PopularDestinationDetailView.swift
//  TravelApp
//
//  Created by Will Wang on 6/15/21.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailView: View {
    
    @ObservedObject var detailViewModel: DestinationDetailViewModel
    
    var name: String
    var attractions: [Attraction] = [
        .init(name: "Eiffel Tower", lat: 48.859565, long: 2.2946, imageName: "image0"),
        .init(name: "Champs-Elysees", lat: 48.859565, long: 2.311780, imageName: "image3"),
        .init(name: "Louvre Museum", lat: 48.859565, long: 2.337789, imageName: "image2")
    ]
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    init(name: String) {
        self.name = name
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: 0.0, longitude: 0.0), span: .init(latitudeDelta: 0.07, longitudeDelta: 0.07)))
        self.detailViewModel = .init(name: name)
    }
    
    var body: some View {
        ScrollView {
            
            if let photos = detailViewModel.detail?.photos {
                PopularDestinationHeader(photos: photos)
                    .frame(height: 300)
            }
            
            VStack(alignment: .leading) {
                
                Text(detailViewModel.detail?.name ?? "")
                    .font(.largeTitle.bold())
                Text(detailViewModel.detail?.country ?? "")
                    .foregroundColor(.secondary)
                    .font(.title3.bold())
                
                HStack {
                    ForEach(0 ..< 5) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                HStack {
                    Text(detailViewModel.detail?.description ?? "")
                    Spacer()
                }.padding(.top, 2)
                
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
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
//                MapMarker(coordinate: .init(latitude: attraction.lat, longitude: attraction.long), tint: Color(UIColor.systemBlue))
                MapAnnotation(coordinate: .init(latitude: attraction.lat, longitude: attraction.long)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
            
        }.navigationBarTitle(name, displayMode: .inline)
    }
}


struct PopularDestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailView(name: "paris")
        }
        
//        DiscoverView()
//        PopularDestinationsView()
    }
}
