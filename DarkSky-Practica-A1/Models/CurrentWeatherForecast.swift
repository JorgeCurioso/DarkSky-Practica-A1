//
//  CurrentWeather.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/15/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct CurrentWeatherForecast {
    
    var temperature: Float
    
    init(raw: RawCurrentWeatherForecast) {
        temperature = raw.temperature
    }
    
}

struct RawCurrentWeatherForecast: Codable {
    
    var temperature: Float
    
}
