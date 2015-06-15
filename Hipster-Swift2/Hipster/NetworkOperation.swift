//
//  NetworkOperation.swift
//  Hipster
//
//  Created by Dulio Denis on 6/14/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
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
        
        
}
        





                    
                    
//                    let newData: NSData
//                    if (data != nil) {
//                        newData = data! as NSData
//                    }
//                    if let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) {
//                        if let jsonDictionary = json as? NSDictionary {
//                            completion(jsonDictionary as? [String : AnyObject])
//                        }
//                    }
//                    
//                    let jsonDictionary = NSJSONSerialization.JSONObjectWithData(<#T##data: NSData##NSData#>, options: <#T##NSJSONReadingOptions#>)
//                    
////                    do {
////                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: nil) as? [String: AnyObject]
////                        completion(jsonDictionary)
////                    } catch {
////                        print("Some error")
////                    }
//                    
//                default:
//                    print("GET request not successful. HTTP status code: \(HTTPResponse.statusCode)")
//                }
//                
//            } else {
//                // Alert User of issue with Response
//                print("Error - not a valid HTTP Response")
//            }
//            
//            
//
//        }
//    }
//}