//
//  memeController.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class GifController {
    
    // MARK: - Source of Truth
    var gifs : [String]?

    // MARK: - Singleton
    static let shared = GifController()
    
    // MARK: - Properties
    let baseURL = URL(string: "https://api.tenor.com/v1")
    let apiKey = "8ZNGHJOGN4RF"
    
    // MARK: - Fetch Data
    func fetchGifURL(searchTerm: String, completion: @escaping([String]) -> Void) {
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
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                completion([]) ; return
            }
            
            guard let data = data else { print("☎️ No data found") ; completion([]) ; return }
            do {
                var tinygifs : [String] = []
                let topLevelJSON = try JSONDecoder().decode(TopLevelJSON.self, from: data)
                let results = topLevelJSON.results
                for result in results {
                    let media = result.media
                    for gif in media {
                        let tinygif = gif.tinygif
                        let url = tinygif.url
                        tinygifs.append(url)
                    }
                }
                completion(tinygifs)
                
            } catch {
                print("🙉 Could not decode topLevelJSON.") ; completion([]) ; return
            }
        }.resume()
    }
    
    func fetchGifImage(gif: TinyGif, completion: @escaping(UIImage?) -> Void) {
        guard let imageURL = URL(string: gif.url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let error = error {
                print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
                completion(nil) ; return
            }
            
            // TODO: - Finish Gif Fetch
            guard let data = data else { completion(nil) ; return }
                print(data)
        }
    }
}
