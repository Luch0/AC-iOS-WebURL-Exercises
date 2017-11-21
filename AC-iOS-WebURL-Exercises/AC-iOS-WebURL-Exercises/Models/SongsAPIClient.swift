//
//  SongsAPIClient.swift
//  AC-iOS-WebURL-Exercises
//
//  Created by Luis Calle on 11/20/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct Song: Codable {
    let song_id: String
    let song_name: String
    let artist_id: String?
    let display_artist: String
    let spotify_id: String?
}

class MusicAPIClient {
    
    let query: String
    
    init(query: String) {
        self.query = query
    }
    
    private let networkHelper = NetworkHelper()
    
    func fetchSongs(completion: @escaping (([Song]) -> Void), failure: @escaping ((Error) -> Void)) {
        var components = URLComponents(string: "http://billboard.modulo.site/search/song")!
        components.queryItems = [
            URLQueryItem(name: "q", value: self.query)
        ]
        let url = components.url!
        let urlRequest = URLRequest(url: url)
        self.networkHelper.perform(urlRequest: urlRequest, completion: { data in
            let jsonDecoder = JSONDecoder()
            do {
                let songs = try jsonDecoder.decode([Song].self, from: data)
                completion(songs)
            } catch {
                failure(error)
            }
        }, failure: failure)
    }
    
}

