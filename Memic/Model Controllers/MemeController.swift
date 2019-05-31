//
//  memeController.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class MemeController {
    
    // MARK: - Source of Truth
    var gifs : [TinyGif]?

    // MARK: - Singleton
    static let shared = MemeController()
    
    // MARK: - Properties
    let baseURL = URL(string: "https://api.tenor.com/v1")
    let apiKey = "8ZNGHJOGN4RF"
    
    // MARK: - Fetch Data
    func fetchGifWithSearch(searchTerm: String, completion:(@escaping([URL]) -> Void)) {
        guard var url = baseURL else { completion([]) ; return }
        url.appendPathComponent("search")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let searchQuery = URLQueryItem(name: "q", value: searchTerm)
        let keyQuery = URLQueryItem(name: "key", value: apiKey)
        let limitQuery = URLQueryItem(name: "limit", value: "8")
        components?.queryItems = [searchQuery, keyQuery, limitQuery]
        
        guard let finalURL = components?.url else { completion([]) ; return }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("🤬 error found when running dataTask \(error.localizedDescription)")
                completion([]) ; return
            }
            
            guard let data = data else { print("☎️ no data found") ; completion([]) ; return }
            do {
                var gifsArray : [URL] = []
                let topLevelJSON = try JSONDecoder().decode(TopLevelJSON.self, from: data)
                let results = topLevelJSON.results
                for result in results {
                    let media = result.media
                    for m in media {
                        let tinygif = m.tinygif
                        let url = tinygif.url
                        gifsArray.append(url)
                    
                    }
                }
                completion(gifsArray)
                
            } catch {
                print("🙉 could not decode topLevelJSON.") ; completion([]) ; return
            }
            
        }.resume()
    }
}
