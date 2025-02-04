//
//  Creatures.swift
//  CatchEmAllSwift
//
//  Created by Oleh on 04.02.2025.
//

import Foundation

@Observable
class Creatures {
    
    private struct Returned: Codable {
        var count: Int
        var next: String
        var results: [Result]
    }
    
    struct Result: Codable, Hashable {
        var name: String
        var url: String
    }
    
    var urlString = "https://pokeapi.co/api/v2/pokemon/"
    var count = 0
    var creaturesArray: [Result] = []
    
    func getData() async {
        print("🕸️ We are accessing the URL \(urlString)")
        
        //Create a url from string
        guard let url = URL(string: urlString) else {
            print("🤬 ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //Try to decode JSON data in our own structures of data
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("🤬 JSON ERROR: Could not decode returned JSON data")
                return
            }
            print("😎 JSON returned! count \(returned.count), next: \(returned.next)")
            self.count = returned.count
            self.urlString = returned.next
            self.creaturesArray = returned.results
        } catch {
            print("🤬 ERROR: Could not get data from \(urlString)")
        }
    }
}
