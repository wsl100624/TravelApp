//
//  CreatorDetailViewModel.swift
//  TravelApp
//
//  Created by Will Wang on 6/20/21.
//

import Foundation


class CreatorDetailViewModel: ObservableObject {
    
    @Published var creatorDetail: CreatorDetail?
    
    init(id: Int) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                            
                do {
                    self.creatorDetail = try JSONDecoder().decode(CreatorDetail.self, from: data)
                } catch let jsonErr {
                    print("Decoding Failed for CreatorDetail:", jsonErr)
                }
            }
        }.resume()
    }
}


struct CreatorDetail: Decodable {
    let profileImage, username, firstName, lastName: String
    let followers, following: Int
    let posts: [Post]
}

struct Post: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}
