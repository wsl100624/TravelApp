//
//  CategoryDetailsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/14/21.
//

import SwiftUI
import Kingfisher


struct CategoryDetailsView: View {
    
    @ObservedObject var detail = CategoryDetail()
    
    var body: some View {
        ZStack {
            if !detail.isLoading {
                ZStack {
                    Text(detail.errorMessage)
                    ScrollView {
                        ForEach(detail.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                KFImage(URL(string: place.thumbnail)!)
                                    .fade(duration: 0.25)
                                    .resizable()
                                    .scaledToFit()
                                Text(place.name)
                                    .font(.body.bold())
                                    .padding()
                            }
                            .asTile()
                            .padding()
                        }
                    }
                }
            } else {
                VStack {
                    LoadingView()
                    Text("Loading...").foregroundColor(.white)
                }
                .padding(20)
                .background(Color.loadingBackground)
                .cornerRadius(12)
            }
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}


struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        
    }
}
