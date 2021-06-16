//
//  CustomMapAnnotation.swift
//  TravelApp
//
//  Created by Will Wang on 6/16/21.
//

import SwiftUI

struct CustomMapAnnotation: View {
    
    let attraction: Attraction
    
    var body: some View {
        
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(5)
            Text(attraction.name)
                .font(.callout.bold())
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(
                                gradient: Gradient(colors: [Color.red, Color.blue]),
                                startPoint: .leading,
                                endPoint: .trailing))
                .foregroundColor(.white)
                
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black)
                )
        }
        .shadow(radius: 5)
    }
}

struct CustomMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapAnnotation(attraction: .init(name: "Eiffel Tower", lat: 48.859565, long: 2.2946, imageName: "image0"))
    }
}
