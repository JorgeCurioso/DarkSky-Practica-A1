//
//  WeatherService.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/14/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct WeatherForecast {
    
}

class WeatherService {
    
    private let scheme = "https"
    private let host = "api.darksky.net"
    private let key = ""
    private let location = "42.3314,-83.0458"
    
    func getDailyForecast(completion: @escaping (WeatherForecast) -> ()) {
        guard let url = forecastURL() else {
            print("could not construct forecast url")
            return
        }
        
        NetworkManager.getDataFor(url: url) { (data) in
            var json: [String: Any] = [:]
            do {
                json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            }
            catch {
                print("could not create json object")
            }
            
            print(json)
            completion(WeatherForecast())
        }
    }
    
    private func forecastURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.darksky.net"
        components.path = "/forecast/\(key)/\(location)"
        
        return components.url
    }
    
}

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
