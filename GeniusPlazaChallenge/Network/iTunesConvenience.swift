//
//  iTunesConvenience.swift
//  GeniusPlazaChallenge
//
//  Created by Pushkar Sharma on 22/02/19.
//  Copyright © 2019 thePsguy. All rights reserved.
//

import Foundation

extension iTunesClient {
    
    func MusicForEndpoint(endpointUrl: String, completion: @escaping (_ error: String?, _ objects: [RSSMusic]?) -> Void) {
        
        let requestURL = self.iTunesUrlFromEndpoint(withPathExtension: endpointUrl)
        
        let request = URLRequest(url: requestURL)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error...
                completion("Network Error", nil)
                return
            }
            
            var parsingError: NSError?
            let parsedResult: AnyObject?
            
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as AnyObject
            } catch let error as NSError {
                parsingError = error
                parsedResult = nil
                print("Parse error - \(parsingError!.localizedDescription)")
                return
            }
            
            if(parsedResult?["error"]! != nil) {
                completion("Parse Error: " + (parsedResult?["error"] as! String), nil)
            } else {
                let musicData = (parsedResult![JSONResponseKeys.feed] as? [String: AnyObject])![JSONResponseKeys.feedData]
                let objects = RSSMusic.objectsFromResults(results: musicData as! [[String : AnyObject]])
                completion(nil, objects)
            }
        }
        task.resume()
    }
}
