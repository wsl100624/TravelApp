//
//  Attraction.swift
//  TravelApp
//
//  Created by Will Wang on 6/16/21.
//

import Foundation

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name: String
    let lat, long: Double
    let imageName: String
}
