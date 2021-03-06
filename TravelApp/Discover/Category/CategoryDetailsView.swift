//
//  CategoryDetailsView.swift
//  TravelApp
//
//  Created by Will Wang on 6/14/21.
//

import SwiftUI
import Kingfisher


struct CategoryDetailsView: View {
    
    private let name: String
    @ObservedObject private var detail: CategoryDetail
    
    init(name: String) {
        self.name = name
        self.detail = .init(name: name)
    }
    
    var body: some View {
        ZStack {
            if !detail.isLoading {
                ZStack {
                    if !detail.errorMessage.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 50, weight: .semibold))
                                .foregroundColor(Color(UIColor.systemRed))
                            Text(detail.errorMessage)
                                .foregroundColor(.secondary)
                                .font(.callout.bold())
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 64)
                        
                    }
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
        }.navigationBarTitle(name, displayMode: .inline)
    }
}


struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView(name: "food")
        }
        
    }
}
