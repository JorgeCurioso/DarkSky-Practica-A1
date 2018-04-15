//
//  HourlyWeatherForecast.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/15/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct HourlyWeatherForecast {
    
    let forecast: [WeatherSnapshot]
    
    init(raw: RawHourlyWeatherForecast) {
        forecast = raw.data.map({ WeatherSnapshot(raw: $0) })
    }
    
}

struct RawHourlyWeatherForecast: Codable {
    
    let data: [RawWeatherSnapshot]
    
}
