//
//  RestaurantDetail.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import Foundation

struct RestaurantDetail: Decodable {
    let id: Int
    let name, city, country, thumbnail: String
    let description: String
    let popularDishes: [Dish]
    let reviews: [Review]
}

struct Dish: Decodable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}

struct Review: Decodable, Hashable {
    let user: ReviewUser
    let text: String
    let rating: Int
//    let posts: [Post]
}

struct ReviewUser: Decodable, Hashable {
    let id: Int
    let username, firstName, lastName, profileImage: String
}

struct Post: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}

class RestaurantDetailViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var details: RestaurantDetail?
    
    init() {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.details = try? JSONDecoder().decode(RestaurantDetail.self, from: data)
            }
            
 
        }.resume()
    }
}
