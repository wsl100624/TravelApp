//
//  Place.swift
//  TravelApp
//
//  Created by Will Wang on 6/12/21.
//

import Foundation

// MARK: - Discover

struct Place: Decodable, Hashable {
    var name, thumbnail: String
}

struct Destinations: Hashable {
    var name, country, imageName: String
}

struct Creator: Hashable {
    var name, imageName: String
}

let discoverIcons = [
    "square.and.arrow.up",
    "square.and.arrow.up.fill",
    "square.and.arrow.down",
    "square.and.arrow.down.fill",
    "square.and.arrow.up.on.square",
    "square.and.arrow.up.on.square.fill",
    "square.and.arrow.down.on.square",
    "square.and.arrow.down.on.square.fill",
    "pencil",
    "pencil.circle",
    "pencil.circle.fill",
    "pencil.slash"
]

var creatorImages: [String] {
    var images: [String] = []
    (0..<11).forEach { index in
        images.append("creator\(index)")
    }
    return images
}

