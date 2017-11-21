//
//  CitiesAPIClient.swift
//  AC-iOS-WebURL-Exercises
//
//  Created by Luis Calle on 11/20/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct CitiesList: Codable {
    let list: [City]
}

struct City: Codable {
    let name: String
    let coord: CoordWrapper
    let main: MainWrapper
    let wind: WindWrapper
    let weather: [WeatherWrapper]
}

struct CoordWrapper: Codable {
    let lon: Double
    let lat: Double
}

struct MainWrapper: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Int
}

struct WindWrapper: Codable {
    let speed: Double
}

struct WeatherWrapper: Codable {
    let main: String
    let description: String
}

class CitiesAPIClient {
    
    let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    private let networkHelper = NetworkHelper()
    
    func fetchCities(completion: @escaping (([City]) -> Void), failure: @escaping ((Error) -> Void)) {
        var components = URLComponents(string: "http://samples.openweathermap.org/data/2.5/box/city")!
        components.queryItems = [
            URLQueryItem(name: "bbox", value: "12,32,15,37,10"),
            URLQueryItem(name: "appid", value: self.apiKey)
        ]
        let url = components.url!
        let urlRequest = URLRequest(url: url)
        self.networkHelper.perform(urlRequest: urlRequest, completion: { data in
            let jsonDecoder = JSONDecoder()
            do {
                let cities = try jsonDecoder.decode(CitiesList.self, from: data)
                completion(cities.list)
            } catch {
                failure(error)
            }
        }, failure: failure)
    }
    
}
