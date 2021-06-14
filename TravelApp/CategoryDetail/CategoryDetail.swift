//
//  CategoryDetail.swift
//  TravelApp
//
//  Created by Will Wang on 6/14/21.
//

import Foundation


class CategoryDetail: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init() {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { data, respone, error in
            guard let data = data else { return }
            
            do {
                self.places = try JSONDecoder().decode([Place].self, from: data)
            } catch {
                print("Failed to decode category JSON: ", error)
                self.errorMessage = error.localizedDescription
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
        }.resume()
    }
}
