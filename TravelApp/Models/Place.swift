//
//  Place.swift
//  TravelApp
//
//  Created by Will Wang on 6/12/21.
//

import Foundation
import CoreLocation

// MARK: - Discover

struct Place: Decodable, Hashable {
    var name, thumbnail: String
}

struct Destination: Hashable {
    var name, country: String
    var imageNames: [String]
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}

let popularDestinations = [
    Destination(name: "Paris", country: "France", imageNames: ["image0"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "New York", country: "USA", imageNames: ["image2", "creator1"], latitude: 45.141927012290104, longitude: -93.16137679266993),
    Destination(name: "Tokyo", country: "USA", imageNames: ["image3", "creator2"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Beijing", country: "China", imageNames: ["image4", "creator3"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Circle Pines", country: "USA", imageNames: ["image5", "creator4"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Minneapolis", country: "USA", imageNames: ["image6", "creator5"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Shore View", country: "USA", imageNames: ["image7", "creator6"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Beijing", country: "China", imageNames: ["image8", "creator7"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Beijing", country: "China", imageNames: ["image9", "creator8"], latitude: 48.864716, longitude: 2.349014),
    Destination(name: "Beijing", country: "China", imageNames: ["image0", "creator9"], latitude: 48.864716, longitude: 2.349014),
]

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

