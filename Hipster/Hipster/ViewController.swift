//
//  ViewController.swift
//  Hipster
//
//  Created by Dulio Denis on 6/13/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pListPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
           let weatherDictionary = NSDictionary(contentsOfFile: pListPath),
           let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject] {
            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
            print(currentWeather)
            
            currentTemperatureLabel?.text = "\(currentWeather.temperature)º"
            currentHumidityLabel?.text = "\(currentWeather.humidity)%"
            currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
        }
    }

}

