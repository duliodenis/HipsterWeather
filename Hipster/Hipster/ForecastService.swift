//
//  ForecastService.swift
//  Hipster
//
//  Created by Dulio Denis on 7/13/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import Foundation

struct ForecastService {
    let forecastAPIKey: String
    
    let forecastBaseURL: NSURL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: (CurrentWeather? -> Void)) {
        if let forecastURL = NSURL(string: "\(latitude),\(longitude)", relativeToURL: forecastBaseURL) {
            let networkOperation = NetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
            }
        } else {
            println("Could not construct a valid URL")
        }
        
    }
    
    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            println("JSON Dictionary returned nil for 'currently' key")
            return nil
        }
    }
}