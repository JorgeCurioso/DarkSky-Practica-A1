//
//  ViewController.swift
//  DarkSky-Practica-A1
//
//  Created by George Royce on 4/14/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherService = WeatherService()
        weatherService.getDailyForecast { (forecast) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

