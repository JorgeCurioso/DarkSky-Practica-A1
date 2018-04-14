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
    
    private let darkSkyScheme = "https"
    private let darkSkyHost = "api.darksky.net"
    private let darkSkyKey = ""
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
        components.scheme = darkSkyScheme
        components.host = darkSkyHost
        components.path = "/forecast/\(darkSkyKey)/\(location)"
        
        return components.url
    }
    
}

