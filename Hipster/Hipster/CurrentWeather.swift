//
//  CurrentWeather.swift
//  Hipster
//
//  Created by Dulio Denis on 6/14/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityFloat = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityFloat * 100)
        } else {
            humidity = nil
        }
        
        if let precipitationProbabilityFloat = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipitationProbabilityFloat * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary["summary"] as? String
    }
    
}