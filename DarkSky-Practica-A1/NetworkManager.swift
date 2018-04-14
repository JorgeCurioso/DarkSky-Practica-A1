//
//  NetworkManager.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/14/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

class NetworkManager {
    
    class func getDataFor(url: URL, completion: @escaping (Data) -> ()) {
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            completion(data
            )
            }.resume()
    }
}
