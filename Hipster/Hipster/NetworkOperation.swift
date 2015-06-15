//
//  NetworkOperation.swift
//  Hipster
//
//  Created by Dulio Denis on 6/14/15.
//  Copyright (c) 2015 Dulio Denis. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String : AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        let request:NSURLRequest = NSURLRequest(URL: queryURL)
        
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            // 1. Check HTTP Response for successful GET request
            
            if let httpResponse = response as? NSHTTPURLResponse {
                
                switch (httpResponse.statusCode) {
                case 200:
                    // 2. Create JSON object with data
                    let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
                    completion(jsonDictionary)
                    
                default:
                    print("GET request not successful. HTTP code: \(httpResponse.statusCode)")
                }
                
            } else {
                print("Not a valid HTTP response")
            }
            
        }
        
        dataTask.resume()
        
    }
    
}
