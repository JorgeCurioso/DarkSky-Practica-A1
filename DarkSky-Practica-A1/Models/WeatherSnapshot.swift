//
//  WeatherSnapshot.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/15/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation

struct WeatherSnapshot {
    
    let temperature: Float
    
    init(raw: RawWeatherSnapshot) {
        temperature = raw.temperature
    }
}

struct RawWeatherSnapshot: Codable {
    
    let temperature: Float

}
