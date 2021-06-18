//
//  DestinationDetail.swift
//  TravelApp
//
//  Created by Will Wang on 6/18/21.
//

import Foundation


struct DestinationDetail: Decodable {
    let description: String
    let photos: [String]
    let latitude, longitude: Double
    let country, name: String
}

class DestinationDetailViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var detail: DestinationDetail?
    @Published var errorMessage: String = ""
    
    init(name: String) {
        
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
//            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, respone, error in
            
            if let statusCode = (respone as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad request: \(statusCode)"
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                do {
                    self.detail = try JSONDecoder().decode(DestinationDetail.self, from: data)
                } catch {
                    print("Failed to decode category JSON: ", error)
                    self.errorMessage = error.localizedDescription
                }
                
//                self.isLoading = false
            }
            
        }.resume()
    }
}
