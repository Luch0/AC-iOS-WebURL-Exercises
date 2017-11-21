//
//  NetworkHelper.swift
//  AC-iOS-WebURL-Exercises
//
//  Created by Luis Calle on 11/20/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

enum NetworkErrors: Error {
    case noDataReceived
}

class NetworkHelper {
    
    let urlSession = URLSession(configuration: .default)
    
    func perform(urlRequest: URLRequest, completion: @escaping ((Data) -> Void), failure: @escaping ((Error) -> Void)) {
        self.urlSession.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    failure(error)
                }
                guard let data = data else {
                    failure(NetworkErrors.noDataReceived)
                    return
                }
                completion(data)
            }
            }.resume()
    }
    
}

