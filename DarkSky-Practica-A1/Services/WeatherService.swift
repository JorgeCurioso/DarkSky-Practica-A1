//
//  WeatherService.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/14/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

private struct WeatherInfo: Codable {
    let currently: RawCurrentWeatherForecast
    let hourly: RawHourlyWeatherForecast
}

class WeatherService {
    
    private let darkSkyScheme = "https"
    private let darkSkyHost = "api.darksky.net"
    private let darkSkyKey = ""
    private let location = "42.3314,-83.0458"
    
    func getDailyForecast(completion: @escaping (CurrentWeatherForecast, HourlyWeatherForecast) -> ()) {
        guard let url = forecastURL() else {
            print("could not construct forecast url")
            return
        }
        
        NetworkManager.getDataFor(url: url) { (data) in
            do {
                let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: data)
                let current = CurrentWeatherForecast(raw: weatherInfo.currently)
                let hourly = HourlyWeatherForecast(raw: weatherInfo.hourly)
                
                completion(current, hourly)
            }
            catch {
                print("could not create json object")
            }

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

